class SourceController < ApplicationController
  load_and_authorize_resource  only: [:edit, :update, :destroy]

  def index
    @sources = Source.all
  end

  def show
      @all_sources = Source.all
      @user_sources = Source.where(user_id: current_user.id)

      if params[:id] != "show"
        puts "#######################################"
        puts "SHOW PASSED A PARAMETER: #{params[:id]}"
        @change_source = Source.find_by_id(params[:id])
        puts @change_source.name
        puts "#######################################"
        render :show
      else
    end
  end
end
