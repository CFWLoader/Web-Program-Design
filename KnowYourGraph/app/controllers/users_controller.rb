require 'services/user_service'

class UsersController < ApplicationController

  include UserService

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    # user_params
    param_status = check_params params

    @user = User.new(user_params)

    respond_to do |format|

      if @user.save
        format.html {redirect_to @user, notice: 'User was successfully created.'}
        format.json {render :show, status: :created, location: @user}
      else
        format.html {render :new}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end

    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to @user, notice: 'User was successfully updated.'}
        format.json {render :show, status: :ok, location: @user}
      else
        format.html {render :edit}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url, notice: 'User was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params

    raw_params = params.require(:user).permit(:username, :email, :password_first, :admin, :vistor, :researcher)

    translated_params = ActionController::Parameters.new

    translated_params[:username] = raw_params[:username]
    translated_params[:email] = raw_params[:email]

    translated_params[:password_salt] = translated_params.object_id.to_s + rand.to_s
    translated_params[:password_hash] = Digest::SHA2.hexdigest raw_params[:password_first] + translated_params[:password_salt]

    translated_params[:role] = Set.new
    translated_params[:role] << 'vistor' if raw_params[:vistor] == '1'
    translated_params[:role] << 'admin' if raw_params[:admin] == '1'
    translated_params[:role] << 'researcher' if raw_params[:researcher] == '1'

    translated_params

  end

end
