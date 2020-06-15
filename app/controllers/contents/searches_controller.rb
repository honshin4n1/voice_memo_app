class Contents::SearchesController < ApplicationController
  before_action :set_user

  def index
    @contents = @user.contents.search(params[:keyword], current_user.id)
  end



  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
