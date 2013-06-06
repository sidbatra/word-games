Wordgames::Application.routes.draw do
  resources :solver, :only => :index

  root :to => 'solver#new'
end
