class UsersController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    if @user.save
      flash[:success] = t(:welcome_to_your_medical_diary)
      log_in @user
      redirect_to day_path
    else
      render 'new'
    end
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = t(:updated_user)
      log_in @user
      redirect_to day_path
    else
      flash[:error] = t(:error_could_not_save_data)
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to root_url
  end
end
