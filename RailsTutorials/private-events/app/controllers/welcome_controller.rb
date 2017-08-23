class WelcomeController < ApplicationController
  def index
    if logged_in?
      redirect_to events_path
    else
      redirect_to login_path
    end
  end
end
