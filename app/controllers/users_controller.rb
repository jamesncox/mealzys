class UsersController < ApplicationController
    def new
    end
  
    def create
      #my sessions or user controller is broken and won't send my user to new signup page...forms look fine.
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        # flash[:notice] = "You signed up successfully"
        # flash[:color]= "valid"
        redirect_to root_path
      else 
        # flash[:notice] = "Form is invalid"
        # flash[:color]= "invalid"
        redirect_to login_path
      end
    end
  
    private
  
      def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
      end
end