Rails.application.routes.draw do
  root "pacientes#index"
  resources :pacientes do
     resources :ams
  end

end
