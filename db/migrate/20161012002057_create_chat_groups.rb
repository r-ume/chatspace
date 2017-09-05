class CreateChatGroups < ActiveRecord::Migration
  def change
    create_table :chat_groups, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
      t.string     :name, null: false, default: ''
      t.timestamps        null: false
    end

    add_index :chat_groups, :name,               name: 'index_chat_groups_name'
    add_index :chat_groups, :name, unique: true, name: 'uk_chat_groups_name'
  end
end
