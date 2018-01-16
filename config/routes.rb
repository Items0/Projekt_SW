Rails.application.routes.draw do
  root 'display#index'
  get 'display/index' => 'display#index'
  get 'display/user/:userid' => 'display#showuser', as: :displayUser
  get 'display/user/:userid/training/:trainingid' => 'display#showtraining', as: :displayTraining
end
