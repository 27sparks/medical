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
      flash[:success] = "Herzlich willkommen in Deinem Schmerztagebuch!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.save
      flash[:success] = "Aenderungen wurden gespeichert"
      redirect_to @user
    else
      flash[:error] = "Fehler, Aenderungen konnten nicht gespeichert werden"
      render 'edit'
    end
  end
end
