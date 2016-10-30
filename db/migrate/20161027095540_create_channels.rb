class CreateChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channels do |t|
      t.string :title
      t.belongs_to :user, foreign_key: true
      t.belongs_to :offer, foreign_key: true

      t.timestamps
    end
  end
end
