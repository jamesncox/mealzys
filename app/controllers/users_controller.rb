class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # flash[:notice] = "You signed up successfully"
      # flash[:color]= "valid"
      redirect_to root_path
    else 
      # flash[:notice] = "Form is invalid"
      # flash[:color]= "invalid"
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

    # tdxrfh
end