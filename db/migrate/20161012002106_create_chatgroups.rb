class CreateChatgroups < ActiveRecord::Migration
  def change
    create_table :chatgroups do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end