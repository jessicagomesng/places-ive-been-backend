class CreateUsersCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :users_countries do |t|
      t.integer :user_id
      t.integer :country_id
      
      t.timestamps
    end
  end
end
