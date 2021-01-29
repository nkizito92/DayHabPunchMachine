class ClientsController < ApplicationController
    before_action :sleeping, only: [:destroy, :create, :update]
    def index
        clients = Client.all
        render json: clients, include: [:punches, :driver]
    end
    
    def show
        james = Client.find_by_id(params[:id])
        # render json: james {id: params[:id]}
        render json: james, include: [:punches, :driver] 
    end     

    def create
        # need to be logged in with admin 
        driver = Driver.find_by_id(client_params[:driver_id])
        client = driver.clients.build(client_params)
        client.save
        render json: client, include: [:driver, :punches]
    end

    def update
        # need to be logged in with admin 
        client = Client.find_by_id(client_params[:id])
        client.update(full_name: client_params[:full_name], pay_rate: client_params[:pay_rate], driver_id: client_params[:driver_id])
        render json: client, include: [:driver, :punches]
    end 

    def destroy
        # need to be logged in with admin 
        client = Client.find_by_id(params[:id])
        client.punches.destroy_all
        client.save
        client.delete
        render json: client, include: [:driver, :punches]
    end 
    
    private
    def client_params
        params.require("client").permit(:id, :full_name, :pay_rate, :driver_id, :driver)
    end
    
    def sleeping
        sleep(2.3)
    end
end
