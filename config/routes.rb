Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
	get "/apply/:id", to: "posts#apply", as: "apply_post_path"
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
	get "/post/new", to: "posts#new"
	get "/posts", to: "posts#create_post"
	get "/profile/:id", to: "users#profile" # profile page
	get "/logout",to: "users#logout" #logout
	get "/admin", to: "admin#index"
	get '/profile/:id/approve', to: 'admin#approve' #approve user
	post "/dashboard", to: "users#dashboard"
	post "/posts", to: "posts#create_post" #create post
	post "/apply/:id", to: "posts#apply" #apply post
	post "/login", to: "users#create_login" #auth
	
end
