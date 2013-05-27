TownOMatic::Application.routes.draw do
  resources :genotypes


  resources :phenotypes


  resources :beings
  root to: 'index#show'
end
