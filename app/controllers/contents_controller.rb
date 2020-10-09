class ContentsController < ApplicationController
  before_action :set_genre
  before_action :move_to_root

  def index
    @content = Content.new
    @contents = @genre.contents.includes(:user)
    @genres = current_user&.genres
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      respond_to do |format|
        format.html { redirect_to genre_contents_path(@genre), notice: '作成しました' }
        format.json
      end
    else
      @content = Content.new
      @contents = @genre.contents.includes(:user)
      flash.now[:alert] = '入力に誤りがあります'
      render :index
    end
  end

  def edit
    @content = Content.find(params[:id])
    @genres = current_user&.genres
  end

  def update
    @content = Content.find(params[:id])
    if @content.update(content_params)
      redirect_to genre_contents_path(@genre), notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    content = Content.find(params[:id])
    content.destroy
    respond_to do |format|
      format.html { redirect_to genre_contents_path(@genre), notice: '削除しました' }
      format.json
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

  def move_to_root
    redirect_to root_path unless current_user.id == @genre.user_id
  end

end
