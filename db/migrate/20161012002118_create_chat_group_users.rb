class CreateChatGroupUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_group_users, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
      t.integer    :chat_group_id, null: false
      t.integer    :user_id,       null: false
      t.timestamps                 null: false
    end
  end
end
