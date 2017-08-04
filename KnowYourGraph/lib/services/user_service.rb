module UserService

  def check_params params
    p params.require(:user) #.permit(:password_first)
  end

end