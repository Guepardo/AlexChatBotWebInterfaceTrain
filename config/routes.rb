Rails.application.routes.draw do
  resources :bots do 
    get 'brain', on: :member

  	resources :topics do 
      resources :dialogs do
        resources :answers
      end
    end
    
  	resources :intents do
  		resources :statements
  	end
    
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
