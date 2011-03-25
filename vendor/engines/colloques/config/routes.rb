Refinery::Application.routes.draw do
  resources :colloques, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :colloques, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
