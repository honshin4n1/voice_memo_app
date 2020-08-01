class ContentsController < ApplicationController
  before_action :set_genre
  def index
    @content = Content.new
    @contents = @genre.contents.includes(:user)
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to genre_contents_path(@genre), notice: '作成しました'
    else
      render :index
    end
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content =Content.find(params[:id])
    if @content.update(content_params)
      redirect_to genre_contents_path(@genre), notice: '更新しました'
    else
      render :edit
    end
  end

  private

  def content_params
    params.require(:content).permit(
      :title,
      :comment,
      :start_time,
      :display
    ).merge(user_id: current_user.id, genre_id: params[:genre_id])
  end

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end

end
