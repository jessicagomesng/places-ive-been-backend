class FixYCoordForPins < ActiveRecord::Migration[6.0]
  def change
    rename_column :pins, :yCoord, :yPerc
  end
end
