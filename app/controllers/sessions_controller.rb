class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(id: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @users = User.all
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
