class UsersController < ApplicationController
  def new
    render :SignUp
  end

  def create

    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render :SignUp
    end
  end

  def user_profile
    render :user_profile
  end

  def user_params
    user_modified_params =  params.require(:user).permit(:first_Name, :last_Name, :password, :password_confirmation)
    email = params[:user][:email] + '@gatech.edu'
    user_modified_params[:email] = email
    return user_modified_params
  end
end
