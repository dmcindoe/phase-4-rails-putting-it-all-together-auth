class UsersController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def create
      user = User.new(user_params)
  
      if user.valid?
        user.save
        session[:user_id] = user.id
        render json: user, status: :created
      else
        render json: { errors: [user.errors.full_messages] }, status: :unprocessable_entity
      #check if the user is valid
      #if valid, save new user to db using params
      #if valid store userid in session
      #if valid, return jsonL=: user, status: created
      #not valid, render json error and status 422
      end
    end
  
    def show
      render json: @current_user, status: :created
    end
  
    private
  
    def user_params
      params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end
  end
