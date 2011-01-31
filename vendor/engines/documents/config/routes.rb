Refinery::Application.routes.draw do
  resources :documents, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :documents, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
