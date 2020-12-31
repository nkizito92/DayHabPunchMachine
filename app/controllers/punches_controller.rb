class PunchesController < ApplicationController
    before_action :sleeping, only: [:create, :destroy]
    def index
        punches = Punch.all
        render json: punches, include: [:client]
    end

    def show
        james = Punch.find_by_id(params[:id])
        render json: james
    end

    def new
        # need to be logged in with admin 
        @punch = Punch.new
    end
    
    def create 
        # need to be logged in with admin 
        # find client by name
        client = Client.find_by(full_name: params[:punch][:full_name])
        client_punches = client.punches.length
        client_punches = 1 if client_punches === 0 
        # punch_in twice for no reason before punching Out
        if client_punches.odd?
            punched = client.punches.build({client_id: client.id, clock_in: Time.new.strftime("%l:%M %p")})
        else 
            punched = client.punches.build({client_id: client.id, clock_out: Time.new.strftime("%l:%M %p")})
        end 
            
        punched.save
        render json: punched, include: [:client]
        # if the client_id match with the clients id and clock_in is not nil 
        
            # update clock_out
        # else create punch in
    end 

    def clock_out 
        # need to be logged in with admin 
    end

    private

    def sleeping
        sleep(2.2)
    end

end
