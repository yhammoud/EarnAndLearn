class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_email(params[:user][:email].downcase)

    # If the user exists AND the password entered is correct.

    if user && user.authenticate(params[:user][:password])
      if user.email_confirmed
        session[:user_id] = user.id
        redirect_to '/home'
      else
        flash[:error] = 'Please activate your account by following the
        instructions in the account confirmation email you received to proceed'
        redirect_to root_url
      end

      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
    else
      # If user's login doesn't work, send them back to the login modal and show fail message.
      # redirect_to '/login'
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end


end
