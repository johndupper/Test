# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Source.create(name: "tech_news",
#               url: "https://newsapi.org/v1/articles?source=techcrunch&sortBy=latest&apiKey=66944983190c4b47a72a43e3a8605e87",
#               img_url: "http://i.newsapi.org/techcrunch-m.png")
#
# Source.create(name: "cnn_news",
#               url: "https://newsapi.org/v1/articles?source=cnn&apiKey=66944983190c4b47a72a43e3a8605e87",
#               img_url: "http://i.newsapi.org/cnn-m.png")
#
# Source.create(name: "ap_news",
#               url: "https://newsapi.org/v1/articles?source=associated-press&apiKey=66944983190c4b47a72a43e3a8605e87",
#               img_url: "http://i.newsapi.org/associated-press-m.png")


# we have the data we need to dynamically create our seeds

require 'httparty'
require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("https://newsapi.org/sources"))
news_source_list = doc.css('.source')

# available_news = []

news_source_list.each do |news_source|
  name = news_source.css('.logo').attribute('title')
  name_as_string = name.to_s

  news_url_ready = name_as_string.gsub(/\s+/, "-").downcase
  url = "https://newsapi.org/v1/articles?source=#{news_url_ready}&sortBy=top&apiKey=66944983190c4b47a72a43e3a8605e87"
  api_response = HTTParty.get(url).parsed_response

  if api_response["status"] == "ok"

    image = news_source.css('.logo').attribute('style')
    image_string = image.to_s.sub('background-image:url(', '').chomp(')')

    Source.create(
      name: name_as_string,
      url: url,
      img_url: image_string
    )

    # available_news.push(source)

    # model: news logo
    # puts "News Image URL: #{image_string.sub('background-image:url(', '').chomp(')')}\n"
    # puts image_string.sub('background-image:url(', '').chomp(')')
  end
end

# puts available_news
