class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :country
      t.float :latitude
      t.float :longitude

      t.timestamps
    end

    add_index :locations, :latitude
    add_index :locations, :longitude
  end
end
