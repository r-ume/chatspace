require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe '#GET index' do
    let(:chat_group)    { create(:chat_group) }
    let(:index_params)  { { chat_group_id: chat_group } }
    let(:create_params) { { chat_group_id: chat_group, message: attributes_for(:message) } }

    context 'when an user is signed in' do
      login_user
      before do
        get :index, { chat_group_id: chat_group }
      end

      it 'has same @messages as ones in params' do
        messages = create_list(:message, 3, chat_group_id: chat_group.id, user_id: controller.current_user.id)
        expect(assigns(:messages)).to eq messages
      end

      it "has @chat_groups same as params" do
        chat_groups = create_list(:chat_group, 3, user_ids: controller.current_user.id)
        expect(assigns(:chat_groups)).to eq chat_groups
      end

      it 'has an empty message instance' do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it 'render the :index template' do
        expect(response).to render_template :index
      end
    end

    context 'when an user is not signed in' do
      it 'goes to a login page' do
        expect(response).to have_http_status 200
      end
    end
  end

  describe 'GET #create' do
    let(:chat_group)    { create(:chat_group) }
    let(:create_params) { { chat_group_id: chat_group, message: attributes_for(:message) } }

    context 'when an user is signed in' do
      login_user

      it 'checks if an message can be saved' do
        message = build(:message, chat_group_id: chat_group, user_id: controller.current_user.id)
        expect(message).to be_valid
      end

      it 'redirects to chat_group_messages_path' do
        post :create, create_params
        expect(response).to redirect_to chat_group_messages_path
      end

      it 'sees if an message does not get saved' do
        message = build(:message, body: "", image: "")
        expect(message).to be_invalid
      end
    end

    context 'when an user is not signed in' do
      it 'renders new session template' do
        post :create, create_params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
