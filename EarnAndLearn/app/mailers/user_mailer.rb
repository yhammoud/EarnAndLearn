class UserMailer < ActionMailer::Base
  default :from => "yhammoudau@gmail.com"

  def signup_confirmation(user)
    @user = user

    mail(:to => @user.email, :subject => "Earn And Learn - Sign Up Confirmation")
  end
end