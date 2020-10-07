class Contents::SearchesController < ApplicationController

  def index
    @genre = Genre.new
    @genres = current_user&.genres
    @content = Content.new
    @contents = Content.search(params[:content][:keyword], current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

end
