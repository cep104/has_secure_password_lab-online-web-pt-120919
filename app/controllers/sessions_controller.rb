class SessionsController < ApplicationController
    def new
        
    end
  
    def create
      @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
      else
        redirect_to signup_path
      end
    end
  
    def destroy
        User.find(session[:user_id]).destroy      
        session[:user_id] = nil         
        redirect_to '/' 
    end
end
