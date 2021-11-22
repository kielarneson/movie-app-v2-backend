Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/movies" => "movies#create"
  get "/movies/:title" => "movies#show"

  post "/action_movies" => "action_movies#create"
end
