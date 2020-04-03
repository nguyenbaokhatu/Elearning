# frozen_string_literal: true
# Description/Explanation of SessionsController class

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      flash[:success] = 'login success'
      login user
      redirect_to user
    else
      flash.now[:danger] = 'In Invalid email/password combination'
      render :new
    end
  end

  def destroy
    logout if signed_in?
    flash[:success] = 'You are logged out'
    redirect_to users_sign_in_path
  end
end
