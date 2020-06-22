class ActivitiesController < ApplicationController
  before_action :authenticate_organiser!, :except => [:show, :index, :update]
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, :only => :update

  # GET /activities
  # GET /activities.json
  def index
    if current_volunteer
      @activities = Activity.all
      @current_volunteer_id = current_volunteer.id

      respond_to do |format|
        format.json {
            render :json => { 
              activities: @activities.as_json(:include => {:organiser=>{}, :category=>{} }), 
              current_volunteer_id: @current_volunteer_id
            }
        }
      
        format.html
      end
    elsif current_organiser
      @activities = Activity.where(organiser_id: current_organiser.id).order_list(params[:sort_by])
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @participations = Participation.where(activity_id: params[:id])
  end

  # GET /activities/new
  def new
    @activity = Activity.new
    @categories = Category.all
  end

  # GET /activities/1/edit
  def edit
    @categories = Category.all
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)
    @activity.organiser_id = current_organiser.id
    @activity.category_id = 1
    @activity.total_volunteer = 3

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:title, :description, :requirements, :date, :volunteer_count, :img_url)
    end
end
