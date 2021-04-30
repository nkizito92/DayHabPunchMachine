class ImageElementsController < ApplicationController
    

    def index
        images = Image.all
        render json: images, include: [:user, :client]
    end

    def show
        render json: found_image(), include: [:user, :client]
    end

    def create
        image = Image.create(image_params)
        render json: {
            image: image, 
            message: {
                success: " Image Created!!", 
                error: ""
            }
        }, include: [:user, :client]
    end

    def update
        image = found_image()
        person = "User"
        person = "Client" if params[:client_id].empty?
        image.update(image_params)
        render json: {
            image: image, 
            message: {
                success: " #{person} Image Updated!!", 
                error: ""
            }
        }, include: [:user, :client]
    end  

    def destroy
        image = found_image()
        image.delete
        render json: {
            image: image, 
            message: {
                success: " User Image Deleted!!", 
                error: ""
            }
        }, include: [:user, :client]
    end

    private
    def found_image
        image = Image.find_by_id(image_params[:id])
    end

    def image_params 
        params.permit(:user_id, :client_id, :image_element, :body, :id)
    end
end