require 'httparty'
require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("https://newsapi.org/sources"))

sources = doc.css('.source')

# img_text = sources[1].css('.logo').attribute('style').value
# regex to extract the url?
# puts img_text

# each source title
sources.each do |source|
  name = source.css('.logo').attribute('title')
  source_as_string = name.to_s
  # puts source_as_string
  news_url = source_as_string.gsub(/\s+/, "-")
  puts news_url
  # puts "'https://newsapi.org/v1/articles?source=#{news_url}&apiKey=66944983190c4b47a72a43e3a8605e87'"
end


# the difference between urls is this :: &sortBy=top
# https://newsapi.org/v1/articles?source=the-telegraph&sortBy=top&apiKey=66944983190c4b47a72a43e3a8605e87
# https://newsapi.org/v1/articles?source=The-Telegraph&apiKey=66944983190c4b47a72a43e3a8605e87

# each source's article names

# ap_news["articles"].each do |article|
#   puts article["title"]
# end

# tech_news["articles"].each do |tech|
# puts tech_news
# end
