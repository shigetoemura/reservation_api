class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :match_request, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
