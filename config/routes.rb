Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'
  
  get 'welcome/FAQ'

  root 'welcome#index'
  
end
