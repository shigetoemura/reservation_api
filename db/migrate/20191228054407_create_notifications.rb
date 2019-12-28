class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.bigint :request_user_id, :null => false
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
