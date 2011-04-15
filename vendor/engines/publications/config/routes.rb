Refinery::Application.routes.draw do
  resources :publications, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :publications, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
