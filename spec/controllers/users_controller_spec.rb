require 'rails_helper'

describe UsersController do
  let(:user) { create(:user)}
  let(:content) { create(:content)}
  describe 'GET #show' do
    context 'ログインしている場合' do
      before do
        login user
        get :show, params: {id: user.id}
      end
      it "show.html.hamlに遷移すること" do
        expect(response).to render_template :show
      end
      
    #   it '@contentに期待した値が入っていること' do
    #     contents = current_user.contents
    #     expect(assigns(:contents)).to match(contents)
    #   end
    # end

    context 'ログインしていない場合' do
      before do
        get :show, params: {id: user.id}
      end
      it 'top画面にリダイレクトすること' do
      expect(response).to redirect_to(root_path)
      end
    end
  end
end