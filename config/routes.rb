Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "users", to: "users#index"
  get "users/lists"
  post "users/create"
  get "users/new"
  get "users/index"
  post "users/login"
  get "users/register"
  post "users/login_submit"


  get 'apiusers/apiuserlist'
  post 'apiusers/apilogin'
  post 'apiusers/apiregister'
  put 'apiusers/apiupdate'
  delete 'apiusers/apidelete'
  get 'apiusers/apilogout'
  post 'apiusers/addcourse'
  get 'apiusers/getcourses'
  get 'apiusers/getapiuserrestrictdata'
  get 'apiusers/getcourseswithusers'
end
