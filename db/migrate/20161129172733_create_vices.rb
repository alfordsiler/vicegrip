class CreateVices < ActiveRecord::Migration[5.0]
  def change
    create_table :vices do |t|
      t.string :vice_name
      t.integer :vice_cost
      t.string :goal_name
      t.integer :goal_cost
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
