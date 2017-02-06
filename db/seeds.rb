# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'httparty'
require 'open-uri'
require 'nokogiri'

# web-scrape api website for list of news sources:
doc = Nokogiri::HTML(open("https://newsapi.org/sources"))
news_source_list = doc.css('.source')

# for each <div> (that is a news source):
news_source_list.each do |news_source|
  # news source name
  name = news_source.css('.logo').attribute('title')
  name_as_string = name.to_s

  # news source url
  news_url_ready = name_as_string.gsub(/\s+/, "-").downcase
  url = "https://newsapi.org/v1/articles?source=#{news_url_ready}&sortBy=top&apiKey=66944983190c4b47a72a43e3a8605e87"
  api_response = HTTParty.get(url).parsed_response

  # create news source instances if url is valid
  if api_response["status"] == "ok"

    # get the url of the image from out of the inline html style tag
    image = news_source.css('.logo').attribute('style')
    image_string = image.to_s.sub('background-image:url(', '').chomp(')')

    # seed database with information needed
    Source.create(
      name: name_as_string,
      url: url,
      img_url: image_string
    )

  end
end
