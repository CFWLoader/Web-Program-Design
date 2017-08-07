module UserService

  def check_params params

    required_params = params.require(:user).permit :password_first, :password_second

    if required_params[:password_first] != required_params[:password_second]
      return "Confirm password failed!"
    end

    "OK"

  end

end