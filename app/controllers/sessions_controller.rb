class SessionsController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  
  def new
    if current_user
      redirect_to clientes_url
    end
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      ##session[:user_id] = user.id
      redirect_to_target_or_default clientes_url, :notice => "Autenticado com sucesso"
    else
      flash.now[:alert] = "Usuario ou senha incorreta"
      render :action => 'new'
    end
  end

  def destroy
    ##session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Voce saiu do sistema"
  end
end
