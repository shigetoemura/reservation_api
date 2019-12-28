class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name, :null => false
      t.string :image_url, :null => false
      t.string :area, :null => false
      t.string :tel, :null => false
      t.integer :price, :null => false
      t.string :address, :null => false
      t.string :tabelog_url, :null => false

      t.timestamps
    end
  end
end
