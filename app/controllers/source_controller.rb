class SourceController < ApplicationController
  load_and_authorize_resource  only: [:edit, :update, :destroy]

  def index
    @user = current_user
    @sources = Source.all
  end

  def show
    source_id = params[:id]
    @user = current_user
    @source = Source.find_by_id(source_id)
  end

end
