class SourceController < ApplicationController
  load_and_authorize_resource  only: [:edit, :update, :destroy]

  def index
    @sources = Source.all
  end

  def show
      @all_sources = Source.all.order(:name)
      @user_sources = @all_sources.where(user_id: current_user.id)

      if params[:id] != "show"
        @change_source = Source.find_by_id(params[:id])
        if @change_source.user_id == nil
          @change_source.update(user_id: current_user.id)
        else
          @change_source.update(user_id: nil)
        end
        render :show
    end
  end
end
