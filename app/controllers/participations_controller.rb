class ParticipationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @participations = Participation.all

    respond_to do |format|
      format.json {
          render :json => @participations.to_json
      }
    
      format.html
    end
  end

  def create 
    @participation = Participation.new(participation_params)

    respond_to do |format|
      if @participation.save
        format.html { redirect_to @participation, notice: 'Participation was successfully created.' }
        format.json { render :show, status: :created, location: @participation }
      else
        format.html { render :new }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def participation_params
      params.require(:participation).permit(:activity_id, :volunteer_id)
    end
end
