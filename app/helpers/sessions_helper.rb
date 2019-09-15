module SessionsHelper
    # def sign_in_with_auth(auth)
    #     user = User.find_by(uid: auth['uid'])
    #     if user
    #       #sign in the user
    #     else
    #       #create a user with any password.
    #       user = User.create! do |user|
    #         user.password = 'bojanglesicedtea'
    #         user.password_confirmation = 'bojanglesicedtea'
    #         user.provider = auth['provider']
    #       end
    #       #then sign in the user
    #     end
    #   end
      
    #   def sign_in_with_password
    #     @user = User.find_by(name: params[:name])
    #     if @user && @user.authenticate(params[:password])
    #       session[:user_id] = @user.id
    #       redirect_to root_path
    #     else
    #       flash[:message] = "Login failed. Please try again."
    #       render :new
    #     end
    #   end
end 