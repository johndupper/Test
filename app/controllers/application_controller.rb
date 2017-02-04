class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  api_key = ENV["news_api_key"]
end
