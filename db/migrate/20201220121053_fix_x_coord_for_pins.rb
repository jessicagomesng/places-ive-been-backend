class FixXCoordForPins < ActiveRecord::Migration[6.0]
  def change
    rename_column :pins, :xCoord, :xPerc
  end
end
