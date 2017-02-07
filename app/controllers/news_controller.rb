class NewsController < ApplicationController
  def index
    if current_user
      @user = current_user
      @user_news_sources_count = Source.where(user_id: current_user.id).count
      @user_news_source   = Source.where(user_id: current_user.id)
    end
  end

  def show
  end
end
