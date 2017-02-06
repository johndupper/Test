class WelcomeController < ApplicationController

  def index
    @sources = Source.all
  end

end
