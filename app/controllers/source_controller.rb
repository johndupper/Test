class SourceController < ApplicationController

  def index
  end

  def show
    source_id = params[:id]
    @source = Source.find_by_id(source_id)
  end

end
