class UsersController < ApplicationController
  def index
  end

  def show
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    
  end



  private
  def genre_params
    params.require(:genre).permit(:name).merge(user_id: current_user.id)
  end
end
