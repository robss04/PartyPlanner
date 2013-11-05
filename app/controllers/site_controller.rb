class SiteController < ApplicationController
  
  def index
    if current_user
	    @users = User.all.entries
      # @first_user = User.first
    	render "index"
    else
    	render "main"

    end
  end
  
  def privacy
    
  end
  
  def terms
    
  end
end