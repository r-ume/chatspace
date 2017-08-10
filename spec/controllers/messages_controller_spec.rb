require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe '#GET index' do
    context 'ログインしている場合' do
      it 'アクション内で定義しているインスタンス変数があるか' do

      end

      it '該当するビューが描画されているか' do

      end
    end

    context 'ログインしていない場合' do
      it '意図した画面にリダイレクトできているのか' do

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
