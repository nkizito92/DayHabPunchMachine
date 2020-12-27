class PunchesController < ApplicationController

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
        if client.punches.length.odd?
            punched = client.punches.build({client_id: client.id, clock_in: Time.new.strftime("%l:%M %p")})
        else 
            punched = client.punches.build({client_id: client.id, clock_out: Time.new.strftime("%l:%M %p")})
        end 
            
        punched.save
        sleep(2.3)
        render json: punched
        # if the client_id match with the clients id and clock_in is not nil 
        
            # update clock_out
        # else create punch in
    end 

    def clock_out 
        # need to be logged in with admin 
    end

end
