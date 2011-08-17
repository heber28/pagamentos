class ClientesController < ApplicationController
  def index
    @clientes = Cliente.search(params[:search], current_user.id)
  end

  def show
    @cliente = Cliente.find(params[:id])
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(params[:cliente])
    @cliente.user_id = current_user.id
    if @cliente.save
      redirect_to @cliente, :notice => "O cliente foi criado com sucesso."
    else
      render :action => 'new'
    end
  end

  def edit
    @cliente = Cliente.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:id])
    @cliente.user_id = current_user.id
    if @cliente.update_attributes(params[:cliente])
      redirect_to @cliente, :notice  => "O cliente foi atualizado com sucesso."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy
    redirect_to clientes_url, :notice => "O cliente foi excluido com sucesso."
  end

  def list
    @clientes = Cliente.search('', current_user.id)
  end
end
