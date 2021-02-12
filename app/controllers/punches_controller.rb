class PunchesController < ApplicationController
    before_action :sleeping, only: [ :destroy, :update]
    def index
        punches = Punch.all
        render json: punches, include: [:client]
    end

    def show
        james = Punch.find_by_id(params[:id])
        render json: james, include: [:client]
    end

    
    def create        
        client = Client.find_by(full_name: params[:punched][:full_name])
        clocked = ""
        if !client.nil?
            client_punches = client.punches.length + 1
            if client_punches.odd?
                clocked = "Clocked In!"
                punched = client.punches.build({client_id: client.id, clock_in: Time.new.strftime("%H%M"), date: Time.new.strftime("%B"), month_day: Time.new.strftime("%b %e")})
            else 
                clocked = "Clocked Out!"
                punched = client.punches.build({client_id: client.id, clock_out: Time.new.strftime("%H%M"), date: Time.new.strftime("%B"), month_day: Time.new.strftime("%b %e")})
            end 
            punched.save
        end
        if !punched.nil?
            render json: {punched: punched, message: {success: "#{Time.new.strftime("%l:%M %p")} #{client.full_name} #{clocked}", error: ""}}, include: [:client]
        else 
            render json: {punched: punched, message: {success: "", error: "Client Doesn't Exist!"}}, include: [:client]
        end
    end 

    def update
        punch = Punch.find_by_id(params[:id])
        punch.update(punch_params)
        render json: punch, include: [:client]
    end

    def destroy 
        punch = Punch.find_by_id(params[:id])
        punch.delete if !punch.nil?
        render json: punch, include: [:client]
    end

    private

    def sleeping
        sleep(2.2)
    end

    def punch_params
        params.require("punch").permit(:id, :clock_in, :clock_out, :date, :month_day, :client_id, :client )
    end

end
