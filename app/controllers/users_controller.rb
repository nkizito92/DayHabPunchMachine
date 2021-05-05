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
        user = User.find_by(username: params[:editedUser][:username]) 
        passed = 0
        if user && user.authenticate(params[:editedUser][:currentPassword])
            user.update(password: params[:editedUser][:password])
            passed = "true"
        else 
            passed = "false"
        end 

        if user.authenticate(params[:editedUser][:password_confirmation]) && user.authenticate(params[:editedUser][:password]) && passed === "true"
            render json: {user: user, message: {success: "#{user.username} Password Updated!!", error: ""}}, include: [:drivers]
        else 
           message_error()
        end
        sleep(2.3)
    end

    private
    def message_error
        render json: {message: {success: "", error: "Password do not match try again!"}}
    end

    def user_params
        params.require("user").permit(:username, :password, :password_confirmation)
    end
end
