require 'httparty'
require 'open-uri'

class NewsController < ApplicationController
  def index
    @all_news = Source.where(user_id: current_user.id)
    if @all_news.count > 1
      puts "####### MORE THAN ONE SOURCE FOR USER #######"
      @all_news.each do |story|
      #
      end
    end
  end


















  def show
    @sources = Source.where(user_id: current_user.id)

    # loop through user's sources
    @sources.each do |news_source|

      # get news articles per source
      api_response = HTTParty.get(news_source.url).parsed_response

      # if response is good
      if api_response["status"] == "ok"

        # turn api response into array of articles

        # -- ARRAY OF FULL ARTICLES --
        news_array = api_response["articles"]

        # -- ARRAY OF JUST HEADLINES --
        headlines = []

        # loop through articles, add title only
        news_array.each do |story|
          headlines.push(story["title"])
        end

        # WHAT IS THE RESPONSE?
        # puts "News Source: #{news_source.name}: #{headlines} \n\n"

        news_source.headline = headlines
        puts news_source.headline


      end # end :: if status
    end # end :: each loop
  end # end :: show
end








# puts ""
# puts "##### #{news_source.name} #####"
# puts "##### #{news_source.url} #####"
# puts "##### #{news_source.img_url} #####"
# puts "##### #{news_source.news} #####"
# puts ""