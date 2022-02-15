Rails.application.routes.draw do

  resources :pets
  # 👆 This single line, replaces all of this 👇

  # # A user can see all pets
  # get "pets", to: "pets#index"
  # # A user can report a lost pet
  # get "pets/new", to: "pets#new", as: :new_pet
  # post "pets", to: "pets#create"
  # # A user can see info on a single pet
  # get "pets/:id", to: "pets#show", as: :pet
  # # A user can edit details of a pet
  # get "pets/:id/edit", to: "pets#edit", as: :edit_pet
  # patch "pets/:id", to: "pets#update"
  # # A user can remove a pet from the site
  # delete "pets/:id", to: "pets#destroy"


end
