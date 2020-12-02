require 'rails_helper'

describe GenresController do
  let(:user) { create(:user) }
  let(:genre) { create(:genre) }
  describe '#index' do
    context 'ログインしている場合' do
      before do
        login user
        get :index, params: {user_id: user.id, genre_id: genre.id}
      end
      it "index.html.hamlに遷移すること" do
        expect(response).to render_template :index
      end
      it "@genreに期待した値が入っていること" do
        expect(assigns(:genre)).to be_a_new(Genre)
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
      context '保存に失敗した場合'
    end
  end
end