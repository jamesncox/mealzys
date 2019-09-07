class SessionsController < ApplicationController
    def new
    end
  
    def create
      @user = User.find_by(name: params[:name])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:note] = "Failed to Log In"
        redirect_to login_path
      end
    end
  
    def destroy
      session.delete :user_id
      redirect_to '/'
    end
end