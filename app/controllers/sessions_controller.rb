class SessionsController < ApplicationController
    respond_to :json
    # create session / login
    def create
        user = User.find_by(email: login_params[:email])
        if user && user.authenticate(login_params[:password])
            session[:user_id] = user.id
            respond_with User, json: {status: :created, logged_in: true, user: user}
        else
            #render json: {status: 401}
            respond_with status: 401
        end
    end
    
    private
    def login_params
        params.require(:user).permit(:email, :password)
    end
    
end