class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # before_action :authorize_request, except: :create
  before_action :set_user, only: [:show, :update, :destroy]


  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new({"username"=>params["username"], "email"=>params["email"],"password"=>params["password"],"password_confirmation"=>params["password_confirmation"]})

    if @user.save
      session[:user_id] = @user.id
      render json: @user, status: :created
    else 
      puts "User not Found"
      render json: @user.errors, status: :unprocessable_entity
  end

    # if @user.save
    #   render json: @user, status: :created, location: @user
    # else
    #   render json: @user.errors, status: :unprocessable_entity
    # end
    # private
    # def user_params
    #   pa
    # end
    # puts "This is @user #{@user}" #Sting Interpolation
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_user
  #     @user = User.find(params[:id])
  #   end

  #   # Only allow a trusted parameter "white list" through.
  #   def user_params
  #     params.require(:user).permit(:username, :email, :password)
  #   end
end
