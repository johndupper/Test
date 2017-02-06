require 'httparty'
require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("https://newsapi.org/sources"))
news_source_list = doc.css('.source')

# array for available news apis
available_news = []


news_source_list.each do |news_source|
  name = news_source.css('.logo').attribute('title')
  # model: title
  puts name_as_string = name.to_s


  news_url_ready = name_as_string.gsub(/\s+/, "-").downcase
  url = "https://newsapi.org/v1/articles?source=#{news_url_ready}&sortBy=top&apiKey=66944983190c4b47a72a43e3a8605e87"
  api_response = HTTParty.get(url).parsed_response


  if api_response["status"] == "ok"
    # model: api url
    puts "#{name_as_string}: #{api_response["articles"].length} articles."
    available_news.push(news_url_ready)

    image = news_source.css('.logo').attribute('style')
    image_string = image.to_s
    # model: news logo
    puts image_string.sub('background-image:url(', '').chomp(')')
  end
end

puts available_news.length