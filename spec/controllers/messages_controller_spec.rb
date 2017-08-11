require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe '#GET index' do
    let(:chat_group) { create(:chat_group) }
    let(:index_params) { {chat_group_id: chat_group} }

    context 'when an user is signed in' do
      login_user
      before do
        get :index,  params: { chat_group_id: chat_group }
      end

      it 'has same @messages as ones in params' do
        messages = create_list(:message, 3, group_id: chat_group, user_id: controller.current_user)
        expect(assigns(:messages)).to eq messages
      end

      it "has @chat_groups same as params" do
        chat_groups = create_list(:chat_group, user_id: controller.current_user)
        expect(assigns(:chat_groups)).to eq chat_groups
      end

      it 'has an empty message instance' do
        expect(assigns(:message)).to eq message
      end

      it 'render the :index template' do
        expect(response).to render_template :index
      end
    end

    context 'when an user is not signed in' do
      it 'goes to a login page' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET #create' do
    context 'ログインしている場合' do
      context 'メッセージの保存に成功' do
        it 'メッセージの保存ができたか' do

        end

        it '意図した画面に遷移しているのか' do

        end
      end

      context 'メッセージの保存に失敗' do

        it 'メッセージの保存は行われなかったか' do

        end

        it '意図したビューが描画されているか' do

        end
      end
    end

    context 'ログインしていない場合' do
      it '意図した画面にリダイレクトされているのか' do
      end
    end
  end
end
