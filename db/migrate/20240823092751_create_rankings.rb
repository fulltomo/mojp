class CreateRankings < ActiveRecord::Migration[7.2]
  def change
    create_table :rankings do |t|
      t.string :player_name
      t.integer :score
      t.float :time

      t.timestamps
    end
  end
end
