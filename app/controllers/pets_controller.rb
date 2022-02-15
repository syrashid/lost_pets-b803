class PetsController < ApplicationController
  # We use a before action for common actions that need to happen before controller actions.  These include show, edit, update, and destroy, where we need to know which pet we are performing that action on

  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  # 👆 can also be like this 👇
  # before_action :set_pet, except: [:index, :new, :create]


  def index
    @pets = Pet.all
  end

  # We've abstracted away all this code with our before action above, the method is a private method only accessible by our controller
  def show; end

  # We always need to pass a new instance of our model to the form, think of it as passing a blank canvas for the user to then provide attribute information for through the form
  def new
    @pet = Pet.new
  end

  # What is this pet_params?  See the private method below 👇
  def create
    pet = Pet.new(pet_params)
    pet.save!
    redirect_to pet_path(pet)
  end

  def edit; end

  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    # After we destroy the pet, where does it make sense for us to be redirected to?  Probably the index page
    @pet.destroy
    # We tell rails where to direct us by taking the prefix and adding "_path"
    redirect_to pets_path
  end

  private
  # Our little before action method that sets which pet we want to interact with before certain controller actions
  def set_pet
    @pet = Pet.find(params[:id])
  end

  # This is the principle of using Strong Parameters.  The core idea here is we want to make sure we only allow specific information from the user to come through, specifically information we asked for, nothing more.  This prevents nefarious users from providing info that we may not want.  To get a better understanding of this, throw a raise into the create action and see the difference between the regular params and pokemon params in the little console at the bottom of the page, 👀 peep the permitted value
  def pet_params
    params.require(:pet).permit(:name, :address, :age, :found_on, :species)
  end
end
