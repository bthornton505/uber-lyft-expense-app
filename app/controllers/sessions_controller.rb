class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else

      @user = User.find_by(name: params[:session][:name])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash.now.alert = "Incorrect name and/or password"
        render :new
      end
    end

  end

  def destroy
    session.clear
    redirect_to root_url
  end

end
