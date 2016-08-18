class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :length
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
