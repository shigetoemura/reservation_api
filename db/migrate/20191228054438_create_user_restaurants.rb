class CreateUserRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :user_restaurants do |t|
      t.references :user, foreign_key: true, :null => false
      t.references :restaurant, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
