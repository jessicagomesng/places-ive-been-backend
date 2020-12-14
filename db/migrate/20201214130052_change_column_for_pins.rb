class ChangeColumnForPins < ActiveRecord::Migration[6.0]
  def change
    change_column :pins, :xCoord, :float
  end
end
