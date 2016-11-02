require 'rails_helper'

describe MessagesController do
  describe 'GET #index' do
    it 'renders the :index template' do
      messages = Message.all
      get :index
      expect(response).to render_template :index
      expect(assigns(:messages)).to eq(messages)
    end
  end

  describe 'POST #create' do
    it 'create a new message' do
      expect {
        post :message, message: params
      }.to change(Message, :count).by(1)
    end
  end
end
