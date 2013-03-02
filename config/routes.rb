Wordgames::Application.routes.draw do
  resources :unscramble, :only => :index

  root :to => 'unscramble#new'
end
