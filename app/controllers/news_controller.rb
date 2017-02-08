require 'httparty'
require 'open-uri'

class NewsController < ApplicationController
  def index
    @sources = Source.where(user_id: current_user.id)
    # loop through user's sources
    @sources.each do |news_source|
      # get news articles per source
      api_response = HTTParty.get(news_source.url).parsed_response

      # if response is good
      if api_response["status"] == "ok"
        # turn api response into array of articles
        news_array = api_response["articles"]
        # loop through articles, add title only
        headlines = []
        news_array.each do |story|
          # array of headlines
          headlines.push(story["title"])
        end

        news_source.headline = headlines
      end # :: if status
    end   # :: each loop
  end
end
