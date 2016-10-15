class CreateChatgroupusers < ActiveRecord::Migration
  def change
    create_table :chatgroupusers do |t|

      t.integer :chat_group_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
