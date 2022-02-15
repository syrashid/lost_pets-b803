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

  def new
    @pet = Pet.new
  end

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
    @pet.destroy

    redirect_to pets_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :address, :age, :found_on, :species)
  end
end
