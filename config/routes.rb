Yst::Application.routes.draw do

  mount Bubble::Engine => '/'

  namespace :admin, :module => "bubble/admin" do

  end

  scope ":area_code", :as => "area" do
    scope "*page_slug", :as => "page" do
      root :to => "pages#show"
    end
  end

end
