class UsersController < ApplicationController

  def new
    @new_form = true
    if current_user
      redirect_to cats_url
    else
      render :new
    end
  end

  def create
    @user = User.new(user_params)
    p user_params
    if @user.save!
      login!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
