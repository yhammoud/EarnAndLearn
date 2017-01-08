class UsersController < ApplicationController
  layout :determine_layout

  def new
    render root_url
  end

  def create
    byebug
    user = User.new(user_params)
    if user.save
      UserMailer.signup_confirmation(user).deliver_later
      flash[:success] = 'A confirmation email has been sent to your email. Please follow the instruction in the email to log in.'
      redirect_to root_url
    else
      flash[:error] = "Sorry. An error occured, please try to sign up again or contact us for support."
      redirect_to root_url
    end

  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to Earn and Learn! Your email has been confirmed.
      Please sign in to continue."
      redirect_to root_url
    else
      flash[:error] = "Sorry. An error occured, please try to sign up again or contact us for support."
      redirect_to root_url
    end
  end


  def user_params
    user_modified_params =  params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation)
    email = params[:user][:email]
    user_modified_params[:email] = email
    return user_modified_params
  end

  private
  def determine_layout
    current_user ? "logged_in" : "application"
  end
end