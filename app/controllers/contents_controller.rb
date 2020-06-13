class ContentsController < ApplicationController
  before_action :set_genre
  def index
    @content = Content.new
    @contents = @genre.contents.includes(:user)
  end

  def new
  end

  def create
    @content = @genre.contents.new(content_params)
    if @content.save
      redirect_to genre_contents_path(@genre)
    else
      render :index
    end
  end


  private

  def content_params
    params.require(:content).permit(:title, :comment)
    
  end

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end

  
end
