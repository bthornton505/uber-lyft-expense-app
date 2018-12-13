class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    # binding.pry
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_url
  end

end
