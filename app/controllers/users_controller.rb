class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      remember @user
      flash[:success] = "Register success"
      redirect_to root_path
    else
      flash.now[:notice] = "Register failed"
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
  end

  private

  def user_params
    params.require(:user).permit :email, :fullname, :password, :password_confirmation, :avatar
  end
end
