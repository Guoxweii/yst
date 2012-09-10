Yst::Application.routes.draw do

  mount Bubble::Engine => '/'

  namespace :admin, :module => "bubble/admin" do
    namespace "chk" do
      resources :entries do
        
        collection do
          get "checkable"
        end
        
        member do
          match "check"
        end
        
      end
    end
  end
  
  scope ":area_code", :as => "area" do
    scope "*page_slug", :as => "page" do
      root :to => "pages#show"
    end
  end

  root :to => "pages#show"

end
