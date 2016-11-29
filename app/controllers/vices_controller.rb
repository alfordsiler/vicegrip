class VicesController < ApplicationController
  before_action :is_authenticated, only: [:new, :create]
  before_action :current_user

  def index
    @vices = Vice.all
    @users = User.all
  end

  def new
    @vice = Vice.new
  end

  def create
    @current_user.vices.create(vice_params)
    redirect_to vices_path
  end

  def destroy
    Vice.find(params[:id]).delete
    redirect_to vice_path
  end

  def edit
    @vice = Vice.find(params[:id])
  end

  def update
    v = Vice.find(params[:id])
    v.update(vice_params)
    redirect_to vices_path
  end

  def show
    @vice = Vice.find(params[:id])
  end

  def destroy
    Vice.find(params[:id]).delete
    redirect_to vices_path
  end

  private

  def vice_params 
    params.require(:vice).permit(:vice_name, :vice_cost, :goal_name, :goal_cost)  
  end
end
