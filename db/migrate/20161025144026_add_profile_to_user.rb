class AddProfileToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sex, :integer
    add_column :users, :orientation, :integer
    add_column :users, :date_of_birth, :date
    add_column :users, :more_about_me, :string
    add_column :users, :languages, :string
    add_column :users, :is_studying, :boolean
    add_column :users, :guilty_pleasure, :string
    add_column :users, :best_recipe, :string
    add_column :users, :voluntary_work, :string
    add_column :users, :favorite_quote, :string
    add_column :users, :heroic_thing, :string
    add_column :users, :happiest_moment, :string
    add_column :users, :world_better_place, :string
    add_column :users, :top_music, :string
    add_column :users, :top_movies, :string
    add_column :users, :top_series, :string
    add_column :users, :top_books, :string
    add_column :users, :top_games, :string
    add_column :users, :hobbies, :string
    add_column :users, :nick_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company, :string
    add_column :users, :school, :string
    add_column :users, :social_networks, :string
    add_column :users, :blocked, :boolean
    add_column :users, :nationality, :string
    add_column :users, :three_wishes, :string
  end
end
