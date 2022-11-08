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
	get "/dashboard", to: "users#dashboard" # dashboard
	post "/login", to: "users#create_login" #auth
	get "/logout",to: "users#logout" #logout
end
