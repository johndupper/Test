# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Source.create(name: "tech_news",
              url: "https://newsapi.org/v1/articles?source=techcrunch&sortBy=latest&apiKey=66944983190c4b47a72a43e3a8605e87",
                 img_url: "http://i.newsapi.org/techcrunch-m.png")

Source.create(name: "cnn_news",
              url: "https://newsapi.org/v1/articles?source=cnn&apiKey=66944983190c4b47a72a43e3a8605e87",
              img_url: "http://i.newsapi.org/cnn-m.png")

Source.create(name: "ap_news",
              url: "https://newsapi.org/v1/articles?source=associated-press&apiKey=66944983190c4b47a72a43e3a8605e87",
              img_url: "http://i.newsapi.org/associated-press-m.png")
