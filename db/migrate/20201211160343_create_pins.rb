class CreatePins < ActiveRecord::Migration[6.0]
  def change
    create_table :pins do |t|
      t.integer :user_id
      t.string :caption
      t.string :img
      t.integer :xCoord
      t.integer :yCoord

      t.timestamps
    end
  end
end
