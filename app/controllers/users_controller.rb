class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @genre = Genre.new
    @genres = current_user&.genres
    @content = Content.new
    @contents = current_user&.contents
  end

end
