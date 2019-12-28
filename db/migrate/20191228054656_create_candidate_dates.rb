class CreateCandidateDates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidate_dates do |t|
      t.references :match, foreign_key: true
      t.integer :timeframe, :default =>  0
      t.date :date, :null => false
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
