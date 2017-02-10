require 'httparty'
require 'open-uri'
require 'nokogiri'

# web-scrape html
doc = Nokogiri::HTML(open("https://newsapi.org/sources"))
news_source_list = doc.css('.source')
# iterate sources
news_source_list.each do |news_source|
  # name
  name = news_source.css('.logo').attribute('title')
  name_as_string = name.to_s
  # url
  news_url_ready = name_as_string.gsub(/\s+/, "-").downcase
  url = "https://newsapi.org/v1/articles?source=#{news_url_ready}&sortBy=top&apiKey=66944983190c4b47a72a43e3a8605e87"
  #  query source
  api_response = HTTParty.get(url).parsed_response
  # if valid, save
  if api_response["status"] == "ok"
    # image
    image = news_source.css('.logo').attribute('style')
    image_string = image.to_s.sub('background-image:url(', '').chomp(')')
    # seed database
    Source.create(
      name: name_as_string,
      url: url,
      img_url: image_string
    )
  end
end
