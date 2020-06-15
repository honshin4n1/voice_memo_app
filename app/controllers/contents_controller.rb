class ContentsController < ApplicationController
  before_action :set_genre
  # before_action :set_user, only: [:search]
  def index
    @content = Content.new
    @contents = @genre.contents.includes(:user)
  end

  def new
  end

  def create
    @content = @genre.contents.new(content_params)
    if @content.save
      redirect_to user_genre_contents_path
    else
      render :index
    end
  end

  # def search
  #   @contents = @user.contents.search(params[:keyword])
  # end


  private

  def content_params
    params.require(:content).permit(:title, :comment).merge(user_id: current_user.id)
    
  end

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

end
