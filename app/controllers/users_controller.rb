class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password]) # for top-level params
    @user = User.new(user_params) # params nested within a :user hash
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
