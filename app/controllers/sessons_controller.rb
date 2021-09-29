skip_before_action :authorize, only: [:create]

  def create
    #if username and password are euthenticated
    #save user_id in session
    #render json user
    #else
    #render error
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user
    else
      render json: { errors: [ "Invalid username or password"] }, status: :unauthorized
    end
  end

  def destroy
      session.delete :user_id
      head :no_content
  end

end