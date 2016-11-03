require 'rails_helper'

describe MessagesController do
  login_user
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

  describe 'whether devise works' do
    it 'should have a current_user' do
      #2.11からshouldやshould_notは古くなったそう
      expect(subject.current_user).not_to be_nil
    end

    it 'should get index' do
      get 'index'
      response.should be_success
    end
  end
end