Rails.application.routes.draw do
  root 'display#index'
  get 'display/index' => 'display#index'
  get 'display/:id' => 'display#show', as: :eho
end
