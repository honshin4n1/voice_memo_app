class GenresController < ApplicationController
  before_action :set_user
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def new
    
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to user_genres_path
    else 
      render :index
    end
  end

  def update
  end


  private

  def genre_params
    params.require(:genre).permit(:name).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end
