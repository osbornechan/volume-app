class ProfilesController < ApplicationController
  
  def index
    @participation = Participation.where(volunteer_id: current_volunteer.id)
  end
end
