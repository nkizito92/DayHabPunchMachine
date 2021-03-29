class UsersController < ApplicationController
    def index
        users = User.all
        render json: users, include: [:drivers]
    end

    def show
        @user = User.find_by_id(params[:id])
        render json: @user, include: [:drivers]
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            login!
            render json: @user, include: [:drivers]
        end
    end

    def update
        user = User.find_by(username: user_params[:username])
        
        if user && user.authenticate(user_params[:old_password])
            user.update(user_params)
        end 
        if user.authenticate(user_params[:password_confirmation]) && user.authenticate(user_params[:password])
            render json: {user: user, message: {success: "#{user.username} Password Updated!!", error: ""}}, include: [:drivers]
        else 
            render json: {message: {success: "", error: "Password do not match try again!"}}
        end
        sleep(2.3)
    end

    private

    def user_params
        params.require("user").permit(:username, :password, :password_confirmation)
    end
end
