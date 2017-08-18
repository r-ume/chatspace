require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe '#GET index' do
    let(:user)          { create(:user) }
    let!(:chat_group)   { create(:chat_group) }
    let!(:message)      { create(:message, chat_group_id: chat_group.id ) }
    let(:index_params)  { { chat_group_id: chat_group } }
    let(:create_params) { { chat_group_id: chat_group, message: attributes_for(:message) } }

    context 'when an user is signed in' do
      login_user
      before do
        get :index, { chat_group_id: chat_group }
      end

      it 'assigns the requested message to @messages' do
        expect(assigns(:messages)).to include message
      end

      it 'assigns the requested chat_group to @chat_groups' do
        chat_groups = user.chat_groups
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
    let(:user)          { create(:user) }
    let(:chat_group)    { create(:chat_group) }
    let(:valid_create_params) { {
        chat_group_id: chat_group.id, user_id: user.id, message: attributes_for(:message)
    } }
    let(:invalid_create_params) { {
        chat_group_id: chat_group.id, user_id: nil, message: attributes_for(:message, body: nil, image: nil)
    } }

    describe 'when an user is signed in' do
      login_user
      context 'with valid attributes' do
        before do
          post :create, valid_create_params
        end

        it 'checks if an message can be saved' do
          expect{ post :create, valid_create_params }.to change(Message, :count).by(1)
        end

        it 'redirects to chat_group_messages_path' do
          post :create, valid_create_params
          expect(response).to redirect_to chat_group_messages_path
        end

        it 'has the flash message' do
          expect(flash[:notice]).to eq 'successfully sent'
        end
      end

      context 'with invalid attributes' do
        before do
          post :create, invalid_create_params
        end

        it 'sees if an message does not get saved' do
          expect{ post :create, invalid_create_params }.not_to change(Message, :count)
          # message = build(:message, body: "", image: "")
          # expect(message).to be_invalid
        end

        it 'redirects to chat_group_messages_path' do
          expect(response).to redirect_to chat_group_messages_path
        end
      end
    end

    describe 'when an user is not signed in' do
      it 'renders new session template' do
        post :create, valid_create_params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
