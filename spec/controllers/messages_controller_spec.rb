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
      post :message, message: attributes_for(:message)
      expect(Message.count).to eq(1)
    end
  end
end
