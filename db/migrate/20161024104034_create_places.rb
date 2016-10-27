class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.belongs_to :offer
      t.integer :nb_bathrooms
      t.integer :nb_toilets
      t.boolean :internet
      t.boolean :dishwasher
      t.boolean :ac
      t.boolean :parking
      t.boolean :tv
      t.boolean :playstation
      t.boolean :xbox
      t.boolean :smoking
      t.boolean :animals
      t.float :caution_price
      t.float :electricity_price
      t.float :internet_price
      t.float :heating_price
      t.string :detail
      t.string :title
      t.integer :nb_places_availables
      t.string :property_type
      t.integer :surface
      t.string :other_stuff
      t.float :monthly_rent_price
      t.float :total_price
      t.boolean :satellite
      t.boolean :wii
      t.string :other_stuff

      t.timestamps
    end
  end
end
