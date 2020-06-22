import React, {Component} from 'react'
import styles from '../../../../assets/stylesheets/styles.scss';
import axios from 'axios';

export default class Activity extends Component {
    constructor() {
        super()
        this.state = {
            readLess: 'inline',
            readMore: 'none'
        }
    }

    clickHandler(event){
        let activityId = event.target.parentNode.id;

        if (event.target.id === 'sort-recent') {
            this.props.sortRecent()
        } else if (event.target.id === 'sort-title') {
            this.props.sortTitle()
        } else if (event.target.id === 'sort-date') {
            this.props.sortDate()
        } else if (event.target.id === 'sort-category') {
            this.props.sortCategory()
        } else if (event.target.id === 'filter-requirements') {
            this.props.filterRequirements()
        } else {
            event.preventDefault();
            this.setState({
                readLess: 'none',
                readMore: 'inline',
            })
        }
    }

    handleSignUp(event){
        event.preventDefault();

        //Get volunteer_count for activity
        const activityUrl = '/activities/' + event.target.id + '.json'
        axios.get(activityUrl)
          .then((response) => {
              console.log('in the get request')
              console.log(response.data.volunteer_count)
            this.setState({ 
                volunteer_count: parseInt(response.data.volunteer_count)
            })
          }).catch((error)=>{
            console.log(error);
          })

        const participationUrl = '/participations/index.json'

        //Post to participation relational table
        axios.post(participationUrl, {
            activity_id: parseInt(event.target.id),
            volunteer_id: this.props.current_volunteer_id
        })
          .then((response) => {
            const data = response.data
            this.setState({ 
                activities: data
            })
          }).catch((error)=>{
            console.log('There was an error in post')
            console.log(error);
          })

        //Update activities volunteer_count
        axios.put(activityUrl, {
            volunteer_count: parseInt(1)
        })
          .then((response) => {
            const data = response.data
            this.setState({ 
                volunteer_count: data
            })
          }).catch((error)=>{
            console.log('There was an error in put')
            console.log(error);
          })
    }

    activityHandler(){
        alert("Sign up successful. Thank you for volunteering!")
    }

    render() {
        let allActivities = this.props.activities.map(activity => {
            let email = 'mailto:' + activity.organiser.email;

            return (    
                <div className="card-deck mb-3" key={activity.id}>
                    <div className="card text-black" key={activity.id}>
                        <img className="card-img-top" src={activity.img_url} alt={activity.title} />
                        <div className="card-body">
                            <h3 className="card-title"><strong>{activity.title}</strong></h3>
                            <h4 className="card-title">{activity.date}</h4>
                            <p className="card-text description">
                                <span className='read-less' 
                                    id={activity.id}
                                    style={{display: this.state.readLess}}>
                                        {activity.description.slice(0,80) + '... '}
                                    <a href='#'
                                        onClick={(event)=>{this.clickHandler(event)}}> 
                                        read more
                                    </a>
                                </span>
                                <span className='read-more' 
                                    id={activity.id}
                                    style={{display: this.state.readMore}}>
                                        {activity.description}
                                </span>
                            </p>
                            <table>
                                <tbody>
                                    <tr>
                                        <td className='header-col'><strong>Organiser</strong></td>
                                        <td>{activity.organiser.email.split('@')[0].toUpperCase()}</td>
                                    </tr>
                                    <tr>
                                        <td className='header-col'><strong>Category</strong></td>
                                        <td>{activity.category.category}</td>
                                    </tr>
                                    <tr>
                                        <td className='header-col'><strong>Requirements</strong></td>
                                        <td>{activity.requirements}</td>
                                    </tr>
                                    <tr>
                                        <td className='header-col'><strong>Volunteers<br/>required </strong></td>
                                        <td>{activity.total_volunteer}</td>
                                    </tr>
                                </tbody>
                            </table>
                            <br/>
                            <p className="card-text"><small className="text-muted">Posted on {activity.created_at.slice(0,10)}</small></p>
                            <div className='signup-contact-div'>    
                                <form id={activity.id}
                                    onSubmit={(event)=>{this.handleSignUp(event)}}>    
                                    <button type='submit' 
                                            className='btn btn-primary'
                                            onClick={()=>this.activityHandler()}>
                                        Sign up
                                    </button> 
                                </form>  
                                <button className='btn btn-secondary'>
                                    <a href={email} className='contact'>
                                        Contact Organiser
                                    </a>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            )
        })

        return(
            <div>
                <div className='sort'>
                    <h5><em>Sort/ Filter</em></h5>
                    <button className='sort-btn'
                            id='sort-recent'
                            onClick={(event)=>this.clickHandler(event)}>
                        Recent
                    </button>
                    <button className='sort-btn' 
                            id='sort-title'
                            onClick={(event)=>this.clickHandler(event)}>
                        Title
                    </button>
                    <button className='sort-btn' 
                            id='sort-date'
                            onClick={(event)=>this.clickHandler(event)}>
                        Date
                    </button>
                    <button className='sort-btn'
                            id='sort-category'
                            onClick={(event)=>this.clickHandler(event)}>
                        Category
                    </button>
                    <button className='sort-btn'
                            id='filter-requirements'
                            onClick={(event)=>this.clickHandler(event)}>
                        No Requirements
                    </button>
                </div>
                <div className='row'>
                    {allActivities}
                </div>
            </div>
        )
    }
}