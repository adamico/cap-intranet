Refinery::Application.routes.draw do
  resources :enquetes, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :enquetes, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
