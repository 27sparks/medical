class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in @user
      flash[:success] = t(:welcome_to_your_medical_diary)
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = t(:updated_user)
      log_in @user
      redirect_to @user
    else
      flash[:error] = t(:error_could_not_save_data)
      render 'edit'
    end
  end
end
