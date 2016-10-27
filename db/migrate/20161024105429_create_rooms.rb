class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.references :place, foreign_key: true
      t.integer :simple
      t.integer :double
      t.integer :bunk
      t.integer :sofa
      t.float :surface
      t.boolean :is_private

      t.timestamps
    end
  end
end
