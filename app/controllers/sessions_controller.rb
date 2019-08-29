class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(name: params[:user][:name])
      user = user.authenticate(params[:user][:password])
      redirect_to(controller: 'sessions', action: 'new') unless user
      session[:user_id] = user.id
      @user = user
      redirect_to controller: 'welcome', action: 'home'
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