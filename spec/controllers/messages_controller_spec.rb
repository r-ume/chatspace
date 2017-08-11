require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe '#GET index' do
    let(:chat_group)    { create(:chat_group) }
    let(:index_params)  { { chat_group_id: chat_group } }
    let(:create_params) { { chat_group_id: chat_group, message: attributes_for(:message) } }

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
    context 'when an user is signed in' do
      login_user
      context 'when an message get saved' do
        it 'checks if an message can be saved' do
          # user is defined within login_user method
          message = build(:message, chat_group_id: chat_group, user_id: user)
          expect(message).to be_valid
        end

        it 'redirects to chat_group_messages_path' do
          message = create(:message)
          post :create, params: create_params
          expect(response).to redirect_to chat_group_messages_path
        end
      end

      context 'when an message fails to be saved' do
        it 'sees if an message does not get saved' do
          message = build(:message, body: "", image: "")
          expect(message).to be_invalid
        end

        it '意図したビューが描画されているか' do
          message = build(:message, body: "", image: "")
          post :create, params: create_params
          expect(response).to redirect_to group_messages_path
        end
      end
    end

    context 'when an user is not signed in' do
      it 'renders new session template' do
        post :create, params: create_params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
