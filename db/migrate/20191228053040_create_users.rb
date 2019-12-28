class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.integer :age, :null => false
      t.integer :gender, :null =>  false
      t.string :introduction
      t.string :origin
      t.string :language
      t.integer :height
      t.string :school
      t.string :work
      t.integer :drink
      t.boolean :cigarette
      t.string :token

      t.timestamps
    end
  end
end
