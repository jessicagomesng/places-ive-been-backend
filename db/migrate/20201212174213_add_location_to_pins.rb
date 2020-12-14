class AddLocationToPins < ActiveRecord::Migration[6.0]
  def change
    add_column :pins, :location, :string 
  end
end
