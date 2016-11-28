class UserController < ApplicationController
  before_action :is_authenticated, only: [:create]
  before_action :current_user, only: [:index]
  
  def index
    @vices = Vice.all
    @users = User.all
  end

  def new

  end

  def create
    user = User.create(user_params)
    if user.id
      session[:user_id] = user.id
      flash[:success] = 'User created and logged in'
      redirect_to root_path
    else
      flash[:danger] = 'Invalid Credentials'
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
