class CreateUserReports < ActiveRecord::Migration[6.0]
  def change
    create_table :user_reports do |t|
      t.references :user, foreign_key: true
      t.bigint :report_user_id, :null => false
      t.string :reason

      t.timestamps
    end
  end
end
