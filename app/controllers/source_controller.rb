class SourceController < ApplicationController
  load_and_authorize_resource  only: [:edit, :update, :destroy]

  def show
      @all_sources = Source.all.order(:name)
      @user_sources = @all_sources.where(user_id: current_user.id)

      # if url is passed a news source
      if params[:id] != "show"
        @change_source = Source.find_by_id(params[:id])

        # add/remove news source from user's list
        if @change_source.user_id == nil
          @change_source.update(user_id: current_user.id)
        else
          @change_source.update(user_id: nil)
        end

        # re-render same page
        redirect_to :back
      end
  end
end
