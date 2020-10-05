class GenresController < ApplicationController
  
  def index
    @genres = current_user&.genres
    @genre = Genre.new
    @content = Content.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: '作成しました' }
        format.json
      end
    else 
      @genres = current_user&.genres
      @content = Content.new
      flash.now[:alert] = '入力に誤りがあります'
      render :index
    end
  end

  def edit
    @content = Content.new
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genre_contents_path(@genre), notice: '更新しました'
    else
      render :edit
    end
  end



  private

  def genre_params
    params.require(:genre).permit(:name).merge(user_id: current_user.id)
  end

end

