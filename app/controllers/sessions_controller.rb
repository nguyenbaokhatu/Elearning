class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && authenticate(params[:session][:password])
      flash[:success] = "login success"
      sign_in user
      redirect_to user
    else
      flash.now[:danger] = "In Invalid email/password combination"
      render :new
    end
  end
end
