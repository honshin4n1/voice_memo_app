require 'rails_helper'

describe GenresController do
  let(:user) { create(:user) }
  let(:genre) { create(:genre) }
  describe '#index' do
    context 'ログインしている場合' do
      before do
        @user = FactoryBot.create(:user) 
        login @user
        get :index, params: {user_id: @user.id, genre_id: genre.id}
      end
      it "index.html.hamlに遷移すること" do
        expect(response).to render_template :index
      end
      it "@genreに期待した値が入っていること" do
        expect(assigns(:genre)).to be_a_new(Genre)
      end
      it "@genresに期待した値が入っていること" do
        genres = create_list(:genre, 3, user_id: @user.id)
        expect(assigns(:genres)).to match(genres)
      end
    end
    context 'ログインしていない場合' do
      before do
        get :index, params: {genre_id: genre.id}
      end
      it 'index.html.hamlに遷移すること' do
        expect(response).to render_template :index
      end
    end
  end
  describe '#create' do
    let(:params) { {user_id: user.id, genre: attributes_for(:genre)}}
    context 'ログインしている場合' do
      before do
        login user
      end
      context '保存に成功した場合'do
        subject {post :create, params: params}

        it 'genreを保存すること' do
          expect{ subject }.to change(Genre, :count).by(1)
        end
        it 'root_pathへリダイレクトすること' do
          subject
          expect(response).to redirect_to(root_path)
        end
      end
      context '保存に失敗した場合' do
        let(:invalid_params) {{user_id: user.id, genre: attributes_for(:genre, name: nil)}}
        subject {post :create, params: invalid_params}
        it 'genreを保存しないこと' do
          expect{ subject }.not_to change(Genre, :count)
        end
        it 'index.html.haml へ遷移すること' do
          subject
          expect(response).to render_template :index
        end
      end
    end
  end
  describe 'GET #edit' do
    context 'ログインしている場合' do
      before do
        login user
        get :edit, params: {name: genre}
      end
      it "edit.html.hamlに遷移すること" do
        expect(response).to render_template :edit
      end
      it "@genreに期待した値が入っていること" do
        expect(assigns(:genre)).to eq genre
      end
    end
  end
end