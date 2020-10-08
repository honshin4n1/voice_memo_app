class UsersController < ApplicationController
  def show
    @genre = Genre.new
    @genres = current_user&.genres
    @content = Content.new
    user = User.find(params[:id])
    if current_user&.id == user.id
       @contents = user.contents
    else
      redirect_to root_path
    end
  end

end
