class UsersController < ApplicationController

    def create 
        user = User.create(user_params)
            if user.valid?
                session[:user_id] = user.id 
                render json: user, status: :created
            else
                render json: { error: "user.errors.full_message" }, status: :unprocessable_entity   
            end
    end

    def show 
        user = User.find_by(id: session[:user_id])
        if user
            render json: user 
        else
           render json: { error: "user.errors.full_message" }, status: :unauthorized
        end
    end

    private
    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end
end
