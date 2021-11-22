class MoviesController < ApplicationController
  def show
    response = HTTP.get("http://www.omdbapi.com/?apikey=#{Rails.application.credentials.omdb_api_key}&t=#{params[:title]}")
    movie = JSON.parse(response.body)

    runtime = movie["Runtime"].to_i

    if runtime < 120
      movie["formatted_runtime"] = "#{runtime / 60} hour and #{runtime - 60} minutes"
    elsif runtime < 180
      movie["formatted_runtime"] = "#{runtime / 60} hours and #{runtime - 120} minutes"
    elsif runtime < 240
      movie["formatted_runtime"] = "#{runtime / 60} hours and #{runtime - 180} minutes"
    elsif runtime < 300
      movie["formatted_runtime"] = "#{runtime / 60} hours and #{runtime - 240} minutes"
    end

    render json: movie
  end
end
