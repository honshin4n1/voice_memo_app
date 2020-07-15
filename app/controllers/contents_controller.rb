class ContentsController < ApplicationController
  before_action :set_genre
  def index
    @content = Content.new
    @contents = @genre.contents.includes(:user)
  end

  def new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to genre_contents_path(params[:genre_id])
    else
      render :index
    end
  end

  private

  def content_params
    params.require(:content).permit(:title, :comment).merge(user_id: current_user.id, genre_id: params[:genre_id])
    
  end

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end

end
