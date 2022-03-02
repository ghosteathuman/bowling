class CreateFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :frames do |t|
      t.belongs_to :game
      t.integer :score, default: 0, null: false

      t.boolean :first_roll, default: false, null: false
      t.boolean :second_roll, default: false, null: false

      t.timestamps
    end
  end
end
