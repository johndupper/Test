require 'httparty'
require 'open-uri'

class NewsController < ApplicationController
  def index
    @sources = Source.where(user_id: current_user.id)
    @sources.each do |news_source|
      # get news articles per source
      api_response = HTTParty.get(news_source.url).parsed_response
      # if response is good
      if api_response["status"] == "ok"
        # turn api response into array of articles
        articles = api_response["articles"]
        puts articles.class
        news_source.article = articles
      end
    end
  end
end
