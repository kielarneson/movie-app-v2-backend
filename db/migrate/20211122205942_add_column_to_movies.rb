class AddColumnToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :action_movie_id, :integer
  end
end
