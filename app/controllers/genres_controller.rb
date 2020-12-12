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
      @content = Content.new
      @genre = Genre.find(params[:id])
      flash.now[:alert] = '入力に誤りがあります'
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to root_path
  end

  def new_guest_1
    user = User.find_or_create_by!(email: 'guest1@example.com') do |user|
      user.id = 9
      user.name = 'ゲスト1'
      user.password = '0987ju9disi'
    end
    sign_in user
    redirect_to root_path, notice: 'ゲスト1としてログインしました'
  end

  def new_guest_2
    user = User.find_or_create_by!(email: 'guest2@example.com') do |user|
      user.id = 10
      user.name = 'ゲスト2'
      user.password = '987dg123'
    end
    sign_in user
    redirect_to root_path, notice: 'ゲスト2としてログインしました'
  end

  def new_guest_3
    user = User.find_or_create_by!(email: 'guest3@example.com') do |user|
      user.id = 8
      user.name = 'ゲスト3'
      user.password = '7658dj123'
    end
    sign_in user
    redirect_to root_path, notice: 'ゲスト3としてログインしました'
  end


  private

  def genre_params
    params.require(:genre).permit(:name).merge(user_id: current_user.id)
  end

end

