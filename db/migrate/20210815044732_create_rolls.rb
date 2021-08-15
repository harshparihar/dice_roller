class CreateRolls < ActiveRecord::Migration[6.1]
  def change
    create_table :rolls do |t|
      t.references :turn, null: false, foreign_key: true
      t.integer :dice_sides
      t.integer :roll_value

      t.timestamps
    end
  end
end
