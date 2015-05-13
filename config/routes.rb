OsomTablesApp::Application.routes.draw do
  resources :things do
    collection do
      get :list
    end
  end

  get '/' => 'things#index'
end
