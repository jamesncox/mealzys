class SessionsController < ApplicationController
    def new
    end
  
    def create
      @user = User.find_by(name: params[:name])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render new_user_path
      end
    end
  
    def destroy
      session.delete :user_id
      redirect_to '/'
    end
end


# def create
#   user = User.find_by(name: params[:user][:name])
#   if user && user.authenticate(params[:user][:password])
#     session[:user_id] = user.id
#     redirect_to controller: 'welcome', action: 'home'
#   else 
#     flash.now[:alert] = "Email or password is invalid"
#     render controller: 'users', action: 'new'
#   end
# end