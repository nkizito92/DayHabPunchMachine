class ClientsController < ApplicationController
    before_action :sleeping, only: [:destroy, :create]
    def index
        clients = Client.all
        render json: clients, include: [:punches, :driver]
    end
    
    def show
        james = Client.find_by_id(params[:id])
        # render json: james {id: params[:id]}
        render json: james 
        # render json: james, include: [:chat, :guest]
    end     

    def create
        # need to be logged in with admin 
        client = Client.create(full_name: params[:full_name], pay_rate: params[:pay_rate])

        render json: client, include: [:driver, :punches]
    end

    def edit
        # need to be logged in with admin 
        client = Client.find_by_id(params[:id])
        render json: client, include: [:driver, :punches]
    end 

    def delete
        # need to be logged in with admin 
        client = Client.find_by_id(params[:id])
        client.delete
        render json: client, include: [:driver, :punches]
    end 
    
    private
    def client_params
        params.require("client").permit(:id, :full_name, :pay_rate, :driver_id)
    end
    
    def sleeping
        sleep(2.3)
    end
end
