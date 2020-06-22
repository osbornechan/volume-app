import React, {Component} from 'react';
import axios from 'axios';
import Activity from './activity/activity';

export default class App extends Component {
    constructor() {
        super()
        this.state = {
            activities: [],
            current_volunteer_id: ''
        }
    }
    
    getActivities(){
        const url = '/activities.json';
      
        axios.get(url)
          .then((response) => {
            const activities = response.data.activities
            const current_volunteer_id = response.data.current_volunteer_id
            this.setState({ 
                activities: activities,
                current_volunteer_id: current_volunteer_id
            })
          }).catch((error)=>{
            console.log(error);
          })
      }

    componentDidMount(){
        this.getActivities()
    }

    sortRecent(){
        const url = '/activities.json'
            axios.get(url)
                .then((response)=> {
                    const data = response.data.activities.sort((a, b) => (a.created_at > b.created_at) ? 1 : -1)
                    console.log()
                    this.setState({activities: data})
                }).catch((error)=>{
                    console.log(error);
                })
    }

    sortTitle(){
        const url = '/activities.json'
            axios.get(url)
                .then((response)=> {
                    const data = response.data.activities.sort((a, b) => (a.title > b.title) ? 1 : -1)
                    console.log()
                    this.setState({activities: data})
                }).catch((error)=>{
                    console.log(error);
                })
    }

    sortDate(){
        const url = '/activities.json'
            axios.get(url)
                .then((response)=> {
                    const data = response.data.activities.sort((a, b) => (a.date > b.date) ? 1 : -1)
                    console.log()
                    this.setState({activities: data})
                }).catch((error)=>{
                    console.log(error);
                })
    }

    sortCategory(){
        const url = '/activities.json'
            axios.get(url)
                .then((response)=> {
                    const data = response.data.activities.sort((a, b) => (a.category.category > b.category.category) ? 1 : -1)
                    console.log()
                    this.setState({activities: data})
                }).catch((error)=>{
                    console.log(error);
                })
    }

    filterRequirements(){
        const url = '/activities.json'
            axios.get(url)
                .then((response)=> {
                    const data = response.data.activities.filter(activity => activity.requirements.toLowerCase() === 'none')
                    console.log()
                    this.setState({activities: data})
                }).catch((error)=>{
                    console.log(error);
                })
    }

    render() {

        return(
            <div className='container'>
                <Activity 
                    activities={this.state.activities}
                    sortRecent={()=>{this.sortRecent()}} 
                    sortTitle={()=>{this.sortTitle()}}
                    sortDate={()=>{this.sortDate()}}
                    sortCategory={()=>{this.sortCategory()}}
                    filterRequirements={()=>{this.filterRequirements()}} 
                    current_volunteer_id={this.state.current_volunteer_id}/>
            </div>
        )
    }
}