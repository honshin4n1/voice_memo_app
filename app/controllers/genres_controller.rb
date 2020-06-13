class GenresController < ApplicationController
  # before_action :find_genre
  def index
    @genre = Genre.new
    @genre.contents.build
    @genres = Genre.all
    
  end
  
  def new
    
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path
    else 
      render :index
    end
  end

  def update
  end


  private

  def genre_params
    params.require(:genre).permit(:name, contents_attributes: [:title, :comment, :id]).merge(user_id: current_user.id)
  end

  # def find_genre
  #   @genre = Genre.find(params[:genre_id])
  # end

end
