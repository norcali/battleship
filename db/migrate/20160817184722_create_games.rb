class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :score_1, default: 0
      t.integer :turns_1, default: 0
      t.integer :ships_1, default: 4
      t.integer :score_2, default: 0
      t.integer :turns_2, default: 0
      t.integer :ships_2, default: 4
      t.boolean :finished, default: false
      t.timestamps
    end
  end
end
