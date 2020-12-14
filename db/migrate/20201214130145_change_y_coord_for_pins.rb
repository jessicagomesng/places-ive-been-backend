class ChangeYCoordForPins < ActiveRecord::Migration[6.0]
  def change
    change_column :pins, :yCoord, :float
  end
end
