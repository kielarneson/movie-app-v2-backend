class ActionMoviesController < ApplicationController
  def create
    action_movie = ActionMovie.find_by(imdb_id: params[:imdb_id])

    if action_movie
      render json: { message: "This Action movie already exists in the database. See 'Show movie' in console for specific movie information" }, status: :im_used
    else
      action_movie = ActionMovie.new(
        title: params[:title],
        imdb_id: params[:imdb_id],
      )

      if action_movie.save
        render json: { message: "This is a new action movie for the database! Movie successfully saved", movie: action_movie }, status: :created
      else
        render json: { errors: action_movie.errors.full_messages }, status: :bad_request
      end
    end
  end
end
