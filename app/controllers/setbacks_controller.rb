class SetbacksController < ApplicationController
  before_action :is_authenticated, only: [:new, :create]
  before_action :current_user

  def new
  	@setback = Setback.new
  end

  def create
    # @current_user.vices.create(vice_params)
    # redirect_to vices_path
  end

  def destroy
    Setback.find(params[:id]).delete
    redirect_to vice_path
  end

  def edit
  	@setback = Setback.find(params[:id])
  end

  def update
    s = Setback.find(params[:id])
    s.update(setback_params)
    redirect_to vice_path
  end

  def show
  	@setback = Setback.find(params[:id])
  end

  def destroy
    Setback.find(params[:id]).delete
    redirect_to vice_path
  end

  private

  def setback_params 
    params.require(:setback).permit(:setback_date, :setback_cost)  
  end

end
