class CreateChatGroupUsers < ActiveRecord::Migration
  def change
    create_table :chat_group_users do |t|
      t.references :chat_group, null: false, foreign_key: true
      t.references :user,       null: false, foreign_key: true
      t.timestamps              null: false
    end

    add_index :chat_group_users, [:chat_group_id, :user_id],               name: 'index_chat_groups_users_on_chat_group_id_and_user_id'
    add_index :chat_group_users, [:chat_group_id, :user_id], unique: true, name: 'uk_chat_group_users_on_chat_group_id_and_user_id'
  end
end
