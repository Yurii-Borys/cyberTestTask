Rails.application.routes.draw do
  root to: 'semesters#new'
  resources :semesters, shallow: true do
  resources :courses
end
end