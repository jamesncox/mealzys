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

    def destroy
      reset_session
      # session.delete :user_id
      @user.google_token.delete
      redirect_to '/'
    end

    def googleAuth
      access_token = request.env["omniauth.auth"]
      @user = User.from_omniauth(access_token)
      session[:user_id] = @user.id
      @user.google_token = access_token.credentials.token
      refresh_token = access_token.credentials.refresh_token
      @user.google_refresh_token = refresh_token if refresh_token.present?
      redirect_to root_path
    end

end