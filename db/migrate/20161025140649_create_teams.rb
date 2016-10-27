class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.belongs_to :offer, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
