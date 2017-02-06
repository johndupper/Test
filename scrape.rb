require 'httparty'
require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("https://newsapi.org/sources"))
news_source_list = doc.css('.source')

available_news = []

# cycle through html-list of sources
# check url for valid api GET path

news_source_list.each do |news_source|
  name = news_source.css('.logo').attribute('title')
  name_as_string = name.to_s
  news_url_ready = name_as_string.gsub(/\s+/, "-").downcase

  url = "https://newsapi.org/v1/articles?source=#{news_url_ready}&sortBy=top&apiKey=66944983190c4b47a72a43e3a8605e87"
  api_response = HTTParty.get(url).parsed_response

  if api_response["status"] == "ok"
    # puts "#{name_as_string} has #{api_response["articles"].length} articles."
    available_news.push(news_url_ready)
  end
end

puts available_news.length






# NEED TO KNOW:

# api = Rails.application.secrets.news_api_key

# img_text = sources[1].css('.logo').attribute('style').value
# regex to extract the url?
# puts img_text

# link = source.attribute('href')
# link_as_string = link.to_s
# puts link_as_string