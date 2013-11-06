class ProfilesController < ApplicationController
  
  before_action :set_users
  
  def show
    @user = current_user
    # @users = User.all.entries
    # @recommendations = Recommendation.where(profile_name: params[:profile_name]).sort_by { |h| h[:created_at] }.reverse!
  end

  def edit
    redirect_to profile_url(@user_profile.profile_name) unless @current_user == @user_profile
    @current_user = current_user 
    @user_profile = User.find(params[:id])
    # @users = User.all.entries
    # @recommendations = Recommendation.where(profile_name: params[:profile_name]).sort_by { |h| h[:created_at] }.reverse!
  end

  def update
      @current_user = current_user 
      @user_profile = User.find(params[:id])
      if @user_profile.update(user_params)
        redirect_to show_profile_path(@user_profile)
      else
        render 'edit'
      end

      # if @current_user == @user_profile
      #   if params[:user][:image].present?
      #     @user_profile.image = params[:user][:image]
      #   end
      #     @user_profile.update(user_params)
      #     redirect_to profile_url
      # else
      #   if params[:user][:recommendations][:comment].present?
      #     @recommendation = @current_user.recommendations.create( profile_name: @user_profile.profile_name, 
      #                           comment: params[:user][:recommendations][:comment])
      #     @recommendation.save    
      #     flash.now[:notice] = "Recommendation added!"
      #     @recommendations = Recommendation.where(profile_name: params[:profile_name]).sort_by { |h| h[:created_at] }.reverse!
      #     respond_to do |format|
      #       format.js
      #   end
      # end
    # end   
  end

  # def create
  #   @user_profile = User.find_by(profile_name: params[:profile_name])

  #   redirect_to show_profile_url(@user_profile)
  # end

  private

  def set_users
    @users = User.all.entries
  end

  def image_param
    params.require(:user).permit(
      :image
    )
  end

  def user_params
    params.require(:user).permit(
      :name, :city, :state, :phone_number, :travel_booked, :image, :description
    )
  end

end