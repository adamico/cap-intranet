Refinery::Application.routes.draw do
  resources :alertes, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :alertes, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
