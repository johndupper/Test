require 'httparty'
require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("https://newsapi.org/sources"))
news_source_list = doc.css('.source')

available_news = []

news_source_list.each do |news_source|
  name = news_source.css('.logo').attribute('title')
  name_as_string = name.to_s

  news_url_ready = name_as_string.gsub(/\s+/, "-").downcase
  url = "https://newsapi.org/v1/articles?source=#{news_url_ready}&sortBy=top&apiKey=66944983190c4b47a72a43e3a8605e87"
  api_response = HTTParty.get(url).parsed_response

  if api_response["status"] == "ok"

    image = news_source.css('.logo').attribute('style')
    image_string = image.to_s.sub('background-image:url(', '').chomp(')')

    source = {
      name: name_as_string,
      url: url,
      img_url: image_string
    }
    available_news.push(source)

    # model: news logo
    # puts "News Image URL: #{image_string.sub('background-image:url(', '').chomp(')')}\n"
    # puts image_string.sub('background-image:url(', '').chomp(')')
  end
end

puts available_news
