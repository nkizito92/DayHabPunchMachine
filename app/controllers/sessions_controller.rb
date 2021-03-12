class SessionsController < ApplicationController
    def create
        @user = User.find_by(username: session_params[:username].downcase)
        if @user && @user.authenticate(session_params[:password])
          login!
          render json: {
            logged_in: true,
            user: @user,
            message: {
              success: @user.username + ' logged in successfully!',
              error: ""
            }
          }
        else
          render json: { 
            status: 401,
            message: {
              success: "",
              error: 'Wrong password please try again!'
            }
          }
        end
        sleep(2.3)
    end

    def is_logged_in?
        if logged_in? && current_user
          render json: {
            logged_in: true,
            user: current_user
          }
        else
          render json: {
            logged_in: false,
            message: 'no such user'
          }
        end
    end

    def update 
      user = User.find_by(username: user_params[:username])
      byebug
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

    def destroy
          logout!
          render json: {
            status: 200,
            logged_out: true
          }
    end

    private
    def session_params
        params.require(:user).permit(:username, :password)
    end
end