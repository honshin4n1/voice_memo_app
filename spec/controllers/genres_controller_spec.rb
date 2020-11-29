require 'rails_helper'

describe GenresController do
  let(:user) { create(:user)}
  describe '#index' do
    context 'ログインしている場合' do
      before do
        login user
        get :index, params: {user_id: user.id}
      end
      it "index.html.hamlに遷移すること" do
        expect(response).to render_template :index
      end
      it "@genreに期待した値が入っていること" do
        expect(assigns(:genre)).to be_a_new(Genre)
      end
    end
  end
  # describe '#create' do
  #   let(:params) { {genre_id: genre.id, user_id: user.id}}
  #   context 'ログインしている場合' do
  #     before do
  #       login user
  #     end
  #     context '保存に成功した場合'do
  #       subject {post :create, params: params}

  #       it 'genreを保存すること' do
  #         expect{ subject }.to change(Genre, :count).by(1)
  #       end
  #     end
  #   end
  # end
end