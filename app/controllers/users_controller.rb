class UsersController < ApplicationController
  def mypage
    redirect_to "/#{current_user.name}"
  end

  def show
    @genre = Genre.new
    @genres = current_user&.genres
    @content = Content.new
    user = User.find_by!(name: params[:name])
    if current_user&.id == user.id
       @contents = user.contents
    else
      redirect_to root_path
    end
  end

end
