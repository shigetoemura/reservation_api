class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :match, foreign_key: true, :null => false
      t.references :candidate_date, foreign_key: true, :null => false
      t.string :first_name, :null =>  false
      t.string :last_name, :null => false
      t.string :phone_number, :null => false
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
