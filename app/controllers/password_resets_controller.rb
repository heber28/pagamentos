class PasswordResetsController < ApplicationController
  before_filter :login_required, :except => [:new, :edit, :create, :update]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_url, :notice => "Foi enviado um Email com um link para alterar a senha"
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "O prazo para alterar a senha expirou"
    elsif @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "A senha foi alterada!"
    else
      render :edit
    end
  end

end
