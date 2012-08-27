Yst::Application.routes.draw do
  mount Bubble::Engine => '/'

  namespace :admin, :module => "bubble/admin" do
  end

end
