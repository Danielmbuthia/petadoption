module PetsHelper
    def missing_pet_img(pet)
        if pet.pet_photos.attached?
            url_for(pet.pet_photos[0])
        else
            'no-image.png'
        end
    end
end
