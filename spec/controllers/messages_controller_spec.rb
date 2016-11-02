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
      let(:message) { Message.create(body: 'RSpec', chat_group_id: 1 , user_id: 1, image: 'rspec.jpg') }
      before do
        message # ここでデータベースにレコードを保存する
      end

      it 'create a new message' do
        expect(Message.last).to eq message
      end
    end
end

