class VicesController < ApplicationController
  before_action :is_authenticated, only: [:new, :create]
  before_action :current_user

  def index
    @vices = Vice.all
    @users = User.all
    @setbacks = Setback.all
  end

  def new
    @vice = Vice.new
  end

  def create
    @current_user.vices.create(vice_params)
    redirect_to vices_path
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
    @setbacks = Setback.all
    @setbackTotal = Setback.where(:vice_id => @vice.id ).sum(:setback_cost)
    @time_passed = (Time.now - @vice.created_at).to_i / 1.day
    @saved = @vice.vice_cost * @time_passed - @setbackTotal
    @progress = ((@saved.to_f/@vice.goal_cost.to_f) * 100).round(0)
    @until = ((@vice.goal_cost - @saved).to_f / @vice.vice_cost.to_f).to_i
    @could = @vice.vice_cost * @time_passed
    @couldp = ((@could.to_f/@vice.goal_cost.to_f) * 100).round(0)
    
  end

  def destroy
    @vice = Vice.find(params[:id])
    @vice.setbacks.delete(Setback.where(:vice_id => @vice.id ))
    Vice.find(params[:id]).delete
    redirect_to vices_path
  end

  private

  def vice_params 
    params.require(:vice).permit(:vice_name, :vice_cost, :goal_name, :goal_cost)  
  end
end