class GenresController < ApplicationController
  
  def index
    @genres = current_user&.genres
    @genre = Genre.new
    @content = Content.new
  end
  
  def new 
    
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to root_path
    else 
      render :index
    end
  end

  def update
  end

  def show
  end


  private

  def genre_params
    params.require(:genre).permit(:name).merge(user_id: current_user.id)
  end

end

