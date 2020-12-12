class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @genre = Genre.new
    @genres = current_user&.genres
    @content = Content.new
    user = User.find_by!(params[:id])
    # if current_user&.id == user.id
    @contents = current_user&.contents
    # else
    #   redirect_to root_path
    # end
  end

end
