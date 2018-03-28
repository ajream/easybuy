class UsersController < ApplicationController
  # before_filter :find_model

  def new
    @user = User.new
    @is_using_email = true
  end

  def create
    @is_using_email = (params[:user] && !params[:user][:email].nil?)
    @user = User.new(user_params)
    @user.uuid = session[:user_uuid]

    if @user.save
      flash[:notice] = "注册成功，请登录。"
      redirect_to login_path
    else
      render action: :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :telephone, :token)
  end
end