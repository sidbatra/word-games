Wordgames::Application.routes.draw do
  resource :unscramble, :only => [:index]

  root :to => 'unscramble#new'
end
