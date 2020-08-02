class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    if current_user&.id == user.id
       @contents = user.contents
    else
      redirect_to root_path
    end
  end

end
