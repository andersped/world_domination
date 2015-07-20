Rails.application.routes.draw do


  root 'teams#index'
  resources :teams

  #    team_index GET    /team(.:format)               team#index
  #               POST   /team(.:format)               team#create
  #      new_team GET    /team/new(.:format)           team#new
  #     edit_team GET    /team/:id/edit(.:format)      team#edit
  #          team GET    /team/:id(.:format)           team#show
  #               PATCH  /team/:id(.:format)           team#update
  #               PUT    /team/:id(.:format)           team#update
  #               DELETE /team/:id(.:format)           team#destroy

  resources :superheroes, shallow: true

#    superheroes GET    /superheroes(.:format)          superheroes#index
#                POST   /superheroes(.:format)          superheroes#create
#  new_superhero GET    /superheroes/new(.:format)      superheroes#new
# edit_superhero GET    /superheroes/:id/edit(.:format) superheroes#edit
#      superhero GET    /superheroes/:id(.:format)      superheroes#show
#                PATCH  /superheroes/:id(.:format)      superheroes#update
#                PUT    /superheroes/:id(.:format)      superheroes#update
#                DELETE /superheroes/:id(.:format)      superheroes#destroy

  get 'login', to: "sessions#login", as: 'login'

  get 'signup', to: "sessions#signup", as: 'signup'

  post 'login', to: "sessions#attempt_login"

  post 'signup', to: "sessions#create"

  get 'home', to: "sessions#home", as: 'home'

  delete 'logout', to: "sessions#logout"
  
end
