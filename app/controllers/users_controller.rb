class UsersController < ApplicationController
    def new
    end
  
    def create
      #fix this method to reflect similar sinatra syntax with conditional etc..
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else 
        render new_user_path
      end
    end
  
    private
  
      def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
      end
end