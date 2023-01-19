class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :show_id
      t.string :genre
      t.string :title
      t.string :director
      t.string :cast
      t.string :country
      t.string :year
      t.string :published_at
      t.string :rating
      t.string :duration
      t.string :listed_in
      t.text :description

      t.timestamps
    end
  end
end
