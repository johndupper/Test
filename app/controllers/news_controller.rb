require 'httparty'
require 'open-uri'

class NewsController < ApplicationController
  def index
    @sources = Source.where(user_id: current_user.id)
    @sources.each do |news_source|
      # parse json response for each source
      api_response = HTTParty.get(news_source.url).parsed_response
      if api_response["status"] == "ok"
        articles = api_response["articles"]
        news_source.article = articles
      end
    end
  end
end
