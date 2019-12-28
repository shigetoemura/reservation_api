class CreateUserVerifications < ActiveRecord::Migration[6.0]
  def change
    create_table :user_verifications do |t|
      t.references :user, foreign_key: true
      t.string :image_url, :null => false
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
