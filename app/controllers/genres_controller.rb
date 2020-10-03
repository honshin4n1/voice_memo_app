class GenresController < ApplicationController
  
  def index
    @genres = current_user&.genres
    @genre = Genre.new
    @content = Content.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to root_path, notice: '作成しました'
    else 
      redirect_to root_path, alert: '入力に誤りがあります'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to root_path, notice: '更新しました'
    else
      render :edit
    end
  end

  def show
  end


  private

  def genre_params
    params.require(:genre).permit(:name).merge(user_id: current_user.id)
  end

end

