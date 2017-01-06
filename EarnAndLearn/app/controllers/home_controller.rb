class HomeController < ApplicationController
  layout :determine_layout

  def new
    render :home
  end

  private
  def determine_layout
    current_user ? "logged_in" : "application"
  end
end
