class ClientsController < ApplicationController
    def index
        clients = Client.all
        render json: clients, include: [:punches]
    end
    
    def show
        james = Client.find_by_id(params[:id])
        # render json: james {id: params[:id]}
        render json: james 
        # render json: james, include: [:chat, :guest]
    end     

    def new
        # need to be logged in with admin 
        comment = Comment.find_by_id(params[:id])
        guest = Guest.find_by_id(comment.guest_id)
        guest.delete
        comment.delete 
        render json: {id: params[:id]}
    end 

    def create
        # need to be logged in with admin 
    end

    def edit
        # need to be logged in with admin 
    end 

    def update
        # need to be logged in with admin 
    end

    def delete
        # need to be logged in with admin 
    end 
end
