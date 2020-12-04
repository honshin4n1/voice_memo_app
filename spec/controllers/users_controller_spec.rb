require 'rails_helper'

describe UsersController do
  describe 'GET #show' do
    context 'ログインしている場合' do
      before do
        @user = FactoryBot.create(:user) 
        login @user
        get :show, params: {id: @user.id}
      end
      it "show.html.hamlに遷移すること" do
        expect(response).to render_template :show
      end
      
      it '@contentsに期待した値が入っていること' do
        contents = create_list(:content, 3, user_id: @user.id)
        expect(assigns(:contents)).to match(contents)
      end
    end

    context 'ログインしていない場合' do
      before do
        @user = FactoryBot.create(:user) 
        get :show, params: {id: @user.id}
      end
      it 'top画面にリダイレクトすること' do
      expect(response).to redirect_to(root_path)
      end
    end
  end
end