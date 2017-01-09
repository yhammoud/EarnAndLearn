class HomeController < ApplicationController
  layout :determine_layout

  def new
    render :home
  end

  def home
    render :new
  end

  def location
    if !current_user.nil?
      @user = current_user
      @user.latitude = params[:user][:latitude].to_f
      @user.longitude = params[:user][:longitude].to_f
      @user.save!
    end
    render :new
  end

  private
  def determine_layout
    current_user ? "logged_in" : "application"
  end
end
