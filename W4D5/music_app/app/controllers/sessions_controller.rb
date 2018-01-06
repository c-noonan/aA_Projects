class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if @user.nil?
      flash.now[:errors] = ["Invalid username or passord"]
      render :new
    else
      log_in_user!(@user)
      redirect_to bands_url
    end
  end

  # def destroy
  #
  # end

end
