class PetsController < ApplicationController
  before_action :authenticate_user!, except:[:show]
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def set_auth_check
    redirect root_path alert: "You don't have permisions to edit this pet " unless current_user.id == @pet.user_id
  end

  private 
  def pets_params
    params.require(:pet).permit(:title, :pet_description, :active, :is_sprayed, :has_one_transport_cost, :video, :category_id)
  end
end
