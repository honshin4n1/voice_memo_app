class Contents::SearchesController < ApplicationController
  # before_action :set_user

  def index
    # binding.pry
    @contents = Content.search(params[:keyword])
  end



  private

  def set_user
    @user = User.find(params[:id])
  end
end
