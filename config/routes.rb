Rails.application.routes.draw do
  post 'event/join/:id' => 'event#join'
  post 'event/:id/group_update' => 'event#group_update'
  get 'event/:id/group_edit' => 'event#group_edit'
  get 'event/:id/group_event_destroy' => 'event#group_event_destroy'
  get 'event/:id/group_show' => 'event#group_show'
  get 'event/group_post' => 'event#group_post'
  post 'event/group_post_create' => 'event#group_post_create'
  
  get 'event/group' => 'event#group'
  get 'users/new'
  post 'event/:id/destroy' => 'event#destroy'
  get 'event/:id/edit' => 'event#edit'
  post 'event/:id/update' => 'event#update'
  get 'event/:start_date/:user_id/show' => 'event#show'
  get 'event/post' => 'event#post'
  post 'event/create' => 'event#create'
  get 'home/top/:id' => 'home#top'
  post 'home/top/:id' => 'home#top'


  get 'event/post'
  get 'home/top'
  get 'sessions/new'

  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end
