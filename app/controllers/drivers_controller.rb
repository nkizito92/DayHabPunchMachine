class DriversController < ApplicationController
    before_action :sleeping, only: [:create, :destory, :update]
    def index
        drivers = Driver.all
        render json: drivers, include: [:clients, :user]
    end

    def show 
        driver = Driver.find_by_id(params[:id])
        render json: driver, include: [:clients, :user]
    end 

    def create
        driver = Driver.create(driver_params)
        render json: driver, include: [:clients, :user]
    end 

    def update 
        driver = Driver.find_by_id(driver_params[:id])
        driver.update(first_name: driver_params[:first_name], last_name: driver_params[:last_name])
        render json: driver, include: [:clients, :user]
    end 

    def destroy
        driver = Driver.find_by_id(params[:id])
        driver.delete
        render json: driver, include: [:clients, :user]
    end

    private 

    def driver_params
        params.require('driver').permit(:id, :first_name, :last_name, :clients, :user, :user_id)
    end

    def sleeping
        sleep(2.2)
    end
end
