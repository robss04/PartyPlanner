class UserMailer < ActionMailer::Base
  default from: "PartyPlanner <admin@partyplanner.com>"
  
  def reset_email(user, request)
    @user = user
    @host = request.protocol + request.host_with_port
    
    mail to: @user.email, subject: "PartyPlanner: Reset your credentials"
  end
  
  def registration_email(registrant, request)
    @registrant = registrant
    @host = request.protocol + request.host_with_port
    
    mail to: @registrant.email, subject: "PartyPlanner: Complete your registration"
  end
end