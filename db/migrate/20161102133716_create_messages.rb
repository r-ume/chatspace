class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
      t.text       :body,          null: false
      t.string     :image,         null: false, default: ''
      t.integer    :chat_group_id, null: false
      t.integer    :user_id,       null: false
      t.timestamps                 null: false
    end
  end
end
