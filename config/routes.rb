OsomTablesApp::Application.routes.draw do
  resources :things
  resources :stuffs

  resources :things_and_stuffs, only: [:index]

  get '/' => 'things#index'
end
