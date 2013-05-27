TownOMatic::Application.routes.draw do
  resources :beings
  root to: 'index#show'
end
