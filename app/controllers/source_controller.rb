class SourceController < ApplicationController

  def index
    @all = Source.all
  end

  def show
    source_id = params[:id]
    @source = Source.find_by_id(source_id)
  end

end
