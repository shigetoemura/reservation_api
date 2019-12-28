class CreateMatchRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :match_requests do |t|
      t.references :from_user, foreign_key: {to_table: :users}, :null => false
      t.references :to_user, foreign_key: {to_table: :users}, :null => false
      t.references :user_restaurant, foreign_key: true
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
