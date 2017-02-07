class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include CanCan::ControllerAdditions
  # flash[:notice] = "How did you get here?"
  # flash.keep(:notice)
  # redirect_to root_url
  # end
end
