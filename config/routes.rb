Rails.application.routes.draw do
  root 'display#index'
  get 'display/index' => 'display#index'
  get 'display/user/:username' => 'display#showuser', as: :displayUser
  get 'display/user/:username/training/:trainingid' => 'display#showtraining', as: :displayTraining
  post 'save' => 'display#insert'
  get 'saveme/user/:username/training/:trainingid/longitude/:longitude/latitude/:latitude/time/:time' => 'display#savebyget', :constraints => { :longitude => /[\w+\.]+/, :latitude => /[\w+\.]+/ }
end