class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.belongs_to :board
      t.integer :ship_id, default: nil
      t.integer :position, default: nil
      t.boolean :attacked, default: false
      t.timestamps
    end

    add_index :units, :ship_id
  end
end
