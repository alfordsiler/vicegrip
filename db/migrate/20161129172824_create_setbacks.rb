class CreateSetbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :setbacks do |t|
      t.datetime :setback_date
      t.integer :setback_cost
      t.references :user, foreign_key: true
      t.references :vice, foreign_key: true

      t.timestamps
    end
  end
end
