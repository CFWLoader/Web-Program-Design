module UserService

  def check_params params
    required_params = params.require(:user).permit :password_first, :password_second

    p required_params[:password_first]
    p required_params[:password_second]
    
  end

end