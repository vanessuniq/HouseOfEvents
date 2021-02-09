class Api::RegistrationController < ApplicationController
    skip_before_action :require_login, only: [:create]
    #create an account/registration
    def create
        user = User.create(registration_params)
        if user.save
            session[:user_id] = user.id
            render json: {logged_in: true, user: user}, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: 500
        end
    end
    
    private
    def registration_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
end