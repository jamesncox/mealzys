class SessionsController < ApplicationController
    def new
    end

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

    #comment out Google sign-in code for now

    # def create
    #   auth = request.env["omniauth.auth"]
    #   if auth
    #     sign_in_with_auth(auth)
    #   else
    #     sign_in_with_password
    #   end
    # end
  
    def destroy
      session.delete :user_id
      redirect_to '/'
    end

    #comment out Google sign-in code for now
    
    # def googleAuth
    #   # Get access tokens from the google server
    #   access_token = request.env["omniauth.auth"]
    #   user = User.from_omniauth(access_token)
    #   # binding.pry
    #   log_in(user)
    #   # Access_token is used to authenticate request made from the rails application to the google server
    #   user.google_token = access_token.credentials.token
    #   # Refresh_token to request new access_token
    #   # Note: Refresh_token is only sent once during the first request
    #   refresh_token = access_token.credentials.refresh_token
    #   user.google_refresh_token = refresh_token if refresh_token.present?
    #   user.save
    #   # session[:user_id] = @user.id
    #   redirect_to root_path
    # end
end