class UsersController < ApplicationController
    def new
    end
  
    def create
      #fix this method to reflect similar sinatra syntax with conditional etc..
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to controller: 'welcome', action: 'home'
      else 
        render controller: 'users', action: 'new'
      end
    end
  
    private
  
      def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
      end
end