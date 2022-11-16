Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
	resources :users
	resources :tutors
	resources :tutees
  # Defines the root path route ("/")
  # root "articles#index"
	get "/", to: "users#index" #landing page
	get "/login", to: "users#login" #login page
	get "/new", to: "users#new"
	get "/verify", to: "users#verify"
	get "/dashboard", to: "users#dashboard" # dashboard
	get "/posts", to: "posts#create_post"
	get "/profile/:id", to: "users#profile" # profile page
	get "/messages", to: "users#messages" # messages
	get "/logout",to: "users#logout" #logout
	post "/posts", to: "posts#create_post" #create post
	post "/login", to: "users#create_login" #auth
	
end
