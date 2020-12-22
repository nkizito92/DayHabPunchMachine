class PunchesController < ApplicationController

    def index
        punches = Punch.all
        render json: punches
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

        # scan clients id and punch in or punch out will be created
        # grab info from front end
        client = Client.find_by_id(params[:id])

        client.punches.build({client_id: client.id, clock_in: Time.new})
        
        # if the client_id match with the clients id and clock_in is not nil 
        
            # update clock_out
        # else create punch in
    end 

    def clock_out 
        # need to be logged in with admin 
    end

end
