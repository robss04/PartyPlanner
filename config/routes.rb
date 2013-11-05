PartyPlanner::Application.routes.draw do

  # Sign in/out
  get    'login' => 'session#new', as: :login
  post   'login' => 'session#create'
  delete 'logout' => 'session#destroy', as: :logout
  
  # Registration
  get  'register/:code' => 'registration#new', as: :register
  post 'register/:code' => 'registration#create'
  
  # Password reset
  get   'reset/:code' => 'password#edit', as: :reset
  put   'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'
  
  get 'privacy' => 'site#privacy'
  get 'terms'   => 'site#terms'

  #events
  get 'events' => 'events#index', as: :event # list all events
  get 'events/new' => 'events#new', as: :create_event # form to add a new event 
  get 'events/:id' => 'events#show', as: :show_event # show one event
  get 'events/:id/edit' => 'events#edit', as: :edit_event# form to edit event
  
  post 'events' => 'events#create' # create a new event
  put 'events/:id' => 'events#update' # update a event
  patch 'events/:id' => 'events#update' # update an attribute of a event
  delete 'events/:id' => 'events#destroy' # delete a event

  #tasks
  get 'todo' => 'todo#index', as: :todos # list all events
  get 'todo/new' => 'todo#new', as: :create_todo # form to add a new event 
  get 'todo/:id' => 'todo#show', as: :show_todo # show one event
  get 'todo/:id/edit' => 'todo#edit', as: :edit_todo # form to edit event
  
  post 'todo' => 'todo#create' # create a new event
  put 'todo/:id' => 'todo#update' # update a event
  patch 'todo/:id' => 'todo#update' # update an attribute of a event
  delete 'todo/:id' => 'todo#destroy', as: :delete_todo # delete a event


  #profiles
  get 'profiles' => 'profiles#index', as: :profiles # list all events
  get 'profiles/new' => 'profiles#new', as: :create_profile # add person profile form
  get 'profiles/:id' => 'profiles#show', as: :show_profile # show profile
  get 'profiles/:id/edit' => 'profiles#edit', as: :edit_profile #edit profile form

  put 'profiles/:id' => 'profiles#update'
  patch 'profiles/:id' => 'profiles#update'
  delete 'profiles/:id' => 'profiles#destroy'

  
  root 'site#index'

end
