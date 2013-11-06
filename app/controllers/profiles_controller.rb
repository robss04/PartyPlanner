class ProfilesController < ApplicationController
  # List all persons (show table of persons in HTML)
  def index
    @profile = Profile.all.entries
  end
  
  # Show detail for a person with ID = params[:id] (in HTML)
  def show
    @profile = Profile.find_by(id: params[:id])
  end
  
  # Form for adding a new person (in HTML)
  def new
    @profile = Profile.new
  end
  
  # POST to this to create a new person, then redirect to show
  def create
    @profile = Profile.create(profile_params)
    @profile.save
    redirect_to show_profile_url(@profile)
  end
  
  # Form for updating a person with ID = params[:id] (in HTML)
  def edit
    @profile = Profile.find_by(id: params[:id])
  end
  
  # PUT or PATCH to this to update person with ID = params[:id]
  # then redirect to show
  def update
    @profile = Profile.find_by(id: params[:id])
    # @profile.image = params[:id][:image]
    @profile.update(profile_params)
    @profile.update_attributes(profile_params)

    redirect_to show_profile_url(@profile)
  end
  
  # Destroy the person with ID = params[:id]
  # then redirect to index to list remaining persons
  def destroy
    @profile = Profile.find_by(id: params[:id])
    @profile.destroy
    
    redirect_to show_profile_url
  end
  
  private
  
  def profile_params
    params.require(:profile).permit(
      :name, :city, :state, :phone_number, :travel_booked, :image
    )
  end
end