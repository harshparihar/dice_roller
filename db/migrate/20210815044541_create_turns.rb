class CreateTurns < ActiveRecord::Migration[6.1]
  def change
    create_table :turns do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :roll_value

      t.timestamps
    end
  end
end
