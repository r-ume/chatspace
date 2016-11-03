class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body 
      t.integer :chat_group_id
      t.integer :user_id
      t.string :image
      t.timestamps null: false
    end
  end
end