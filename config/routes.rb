Rails.application.routes.draw do
  get 'home', to: 'home#show'
  get 'welcome/:first_name', to: 'welcome#show'
  get 'contact/show'
  get 'team/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
