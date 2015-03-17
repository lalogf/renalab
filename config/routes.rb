Rails.application.routes.draw do
  devise_for :users
  root "pacientes#index"
  resources :pacientes do
     resources :ams
  end

end
