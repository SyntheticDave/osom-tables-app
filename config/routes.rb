OsomTablesApp::Application.routes.draw do
  resources :things

  get '/' => 'things#index'
end
