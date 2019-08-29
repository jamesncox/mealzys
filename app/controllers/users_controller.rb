class UsersController < ApplicationController
    def new
    end
  
    def create
      #fix this method to reflect similar sinatra syntax with conditional etc..
      @user = User.create(user_params)
        if
      render controller: 'users', action: 'new' unless @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'welcome', action: 'home'
    end
  
    private
  
      def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
      end
end