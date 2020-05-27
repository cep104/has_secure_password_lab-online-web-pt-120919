class UsersController < ApplicationController
    def welcome
        @user = current_user
    end
    
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to '/'
            session[:user_id] = @user.id
        else
            redirect_to signup_path
        end

    end

    private 
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
