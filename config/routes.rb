Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/post/new", to: "blog_post#new", as: "new_post"
  post "/post", to: "blog_post#create", as: "blog_posts"
  get "/post/:id/edit", to: "blog_post#edit", as: "edit_post"
  patch "/post/:id", to: "blog_post#update", as: "blog_post"
  get "/post/:id", to: "blog_post#show", as: "post"
  get "/postnotfound/:id", to: "blog_post#postnotfound"

  # Defines the root path route ("/")
  root "blog_post#index"
end
