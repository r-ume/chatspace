class CreateChatGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_groups, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
      t.string     :name, null: false, default: ''
      t.timestamps        null: false
    end

    add_index :chat_groups, :name, unique: true
  end
end
