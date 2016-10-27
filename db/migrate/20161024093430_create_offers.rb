class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.float :budget
      t.integer :nb_wanted_people
      t.date :start_date
      t.date :end_date
      t.boolean :is_mock, default: false
      t.integer :prefered_sex
      t.string :name
      t.json :activities
      t.json :ritual
      t.json :partying
      t.string :nature
      t.string :situation
      t.boolean :blocked, default: false
      t.string :never_do
      t.string :dream_flatmate

      t.timestamps
    end
  end
end
