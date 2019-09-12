class SessionsController < ApplicationController
    def new
    end

    # def create
    #   @user = User.find_or_create_from_auth_hash(env["omniauth.auth"])
    #   session[:user_id] = @user.id
    #   redirect_to root_path
    # end
  
    def create
      @user = User.find_by(name: params[:name])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:message] = "Login failed. Please try again."
        render :new
      end
    end
  
    def destroy
      session.delete :user_id
      redirect_to '/'
    end
end