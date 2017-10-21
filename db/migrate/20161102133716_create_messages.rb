class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
      t.text       :body,       null: false
      t.references :chat_group, null: false, default: 0, foreign_key: true
      t.references :user,       null: false, default: 0, foreign_key: true
      t.string     :image,      null: false, default: ''
      t.timestamps              null: false
    end

    add_index :messages, [:chat_group_id, :user_id]
  end
end
