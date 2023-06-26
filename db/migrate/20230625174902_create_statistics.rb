class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics do |t|
      t.references :match, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.integer :goals
      t.integer :assists
      t.float :pass_accuracy
      t.float :distance_covered

      t.timestamps
    end
  end
end
