Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
	  authenticated :user do
	    root 'admin#index', as: :authenticated_root
	  end
	  unauthenticated do
	   get 'devise/sessions/new', as: :unauthenticated_root
	  end
	  get 'visitors/index'
	  get 'visitors/about'
	  get 'visitors/view'
	  get 'contact/index'
	  get 'contact/create'
	  get 'users/new', :to =>'users#new', :as =>'new_user'
	  put 'users/create'
	  get 'users/change'
	  get 'users/destroyy' 
	  get 'pagess/index'=> 'pagess#index'
	  get 'pagess/create'
	  get 'pagess/change'
	  get  'testimonial/index' 
	  get  'testimonial/create'
	  get 'testimonial/change'
	  get  'content/index' 
	  get  'content/create'
	  get 'content/change'
	  get  'about/index' 
	  get  'about/create'
	  get 'about/change'
	  get 'role/index'
	  get 'config/index'
	  get 'config/create'
	  get 'slider/index'
	  put 'slider/create'
      get 'slider/change'
	  get 'team/index'
	  put 'team/create'
	  get 'team/change'
	  get 'enquiry/index'
	  get 'enquiry/show'
	  get 'signup/new'
	  put 'signup/create'
   end
  resources :users, :pagess, :testimonial, :content, :about, :role, :config, :slider, :team, :contact, :enquiry
end