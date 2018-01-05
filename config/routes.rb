Rails.application.routes.draw do

  root 'users#index', as: 'main'
  post 'users/create' => 'users#create', as: 'create' 
  post 'users/login' => 'users#login', as: 'login'
  delete 'users/logout' => 'users#logout', as: 'logout'

  get 'groups' => 'groups#index', as: 'groups'
  get 'groups(/:id)' => 'groups#show', as: 'groups_show'
  post 'groups/create' => 'groups#create', as: 'groups_create'
  delete 'groups/delete' => 'groups#delete', as: 'groups_delete'

  post 'members/create' => 'members#create', as: 'member_create'
  delete 'members/delete' => 'members#delete', as: 'members_delete' 


end
