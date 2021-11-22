class CreateActionMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :action_movies do |t|
      t.string "title"
      t.string "imdb_id"
      t.timestamps
    end
  end
end
