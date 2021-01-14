class UsersController < ApplicationController
    def index
        users = User.all
        render json: user
    end

    def show
        @user = User.find_by_id(params[:id])
        render json: @user
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            login!
            render json: @user
        end
    end

    private

    def user_params
        params.require("user").permit(:username, :password, :password_confirmation)
    end
end
