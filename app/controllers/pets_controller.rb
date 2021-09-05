class PetsController < ApplicationController
  protect_from_forgery except: [:upload_pet_photos]
  before_action :authenticate_user!, except:[:show]
  before_action :set_pet, except:[:new, :create]
  before_action :set_auth_check, only:[:edit, :update, :delete_pet_photo, :upload_pet_photos]

  def new
    @pet = current_user.pets.build
    @categories = Category.all
  end

  def create
    @pet = current_user.pets.build(pets_params)
    if @pet.save
      #redirect to edit and continue to add other fields
      redirect_to edit_pet_path(@pet), notice: "Great please continue filling out the other fields"
    else
      flash[:alert] = 'An error occurred please try later'
      render [:new]
      #redirect_to request.referrer, flash:{error: @pet.errors.full_message}  debug 
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @pet.update(pets_params)
      flash[:notice] = "Pet Updated successfully."
    else
      flash[:alert] = "Error, nothing has been saved."
    end
    redirect_back(fallback_location: request.referer)
  end

  def show
  end
  
  def upload_pet_photos
    @pet.pet_photos.attach(params[:file])
    render json: {success: true}
  end
  
  def delete_pet_photo
    @img = ActiveStorage::Attachment.find(params[:pet_photo_id])
    @img.purge
    redirect_to edit_pet_path(@pet), notice: 'Photo deleted successfully'
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
