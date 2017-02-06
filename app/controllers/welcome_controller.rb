class WelcomeController < ApplicationController




  def index
    guardian_url = 'http://content.guardianapis.com/search?api-key=7b592822-659d-4434-94a6-0e2c6e3ed734'
    guardian_response = HTTParty.get(guardian_url)
    guardian_news_response = guardian_response.parsed_response
    guardian_news = guardian_news_response["response"]["results"]
    @guardian = guardian_news

    tech_url = "https://newsapi.org/v1/articles?source=techcrunch&sortBy=latest&apiKey=66944983190c4b47a72a43e3a8605e87"
    tech_response = HTTParty.get(tech_url)
    tech_news = tech_response.parsed_response
    @tech_news = tech_news

    cnn_url = 'https://newsapi.org/v1/articles?source=cnn&apiKey=66944983190c4b47a72a43e3a8605e87'
    cnn_response = HTTParty.get(cnn_url)
    cnn_news_response = cnn_response.parsed_response
    cnn_news = cnn_news_response
    @cnn_news = cnn_news

    ap_url = 'https://newsapi.org/v1/articles?source=associated-press&apiKey=66944983190c4b47a72a43e3a8605e87'
    ap_response = HTTParty.get(ap_url)
    ap_news = ap_response.parsed_response
    @ap = ap_news
  end
end
