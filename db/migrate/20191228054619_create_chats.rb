class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.references :match, foreign_key: true
      t.references :user, foreign_key: true
      t.string :text, :null => false

      t.timestamps
    end
  end
end
