class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @contents = user.contents
  end

end
