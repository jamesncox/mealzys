class SessionsController < ApplicationController
    def new
    end
  
    def create
      #something isn't right in here, and i dont know how to fix it.

      #when I click "new user signup" it just logins the last user
      @user = User.find_by(name: params[:name])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to login_path
      end
    end
  
    def destroy
      session.delete :user_id
      redirect_to '/'
    end
end