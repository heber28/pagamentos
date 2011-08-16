class PagamentosController < ApplicationController
  # GET /pagamentos
  # GET /pagamentos.xml
  def index
    @cliente = Cliente.find(params[:cliente_id])
    @pagamentos = @cliente.pagamentos.all    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pagamentos }
    end
  end

  # GET /pagamentos/1
  # GET /pagamentos/1.xml
  def show
    @cliente = Cliente.find(params[:cliente_id])
    @pagamento = @cliente.pagamentos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pagamento }
    end
  end

  # GET /pagamentos/new
  # GET /pagamentos/new.xml
  def new
    @pagamento = Pagamento.new
    @cliente = Cliente.find(params[:cliente_id])
    @pagamento.data = Time.now
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pagamento }
    end
  end

  # GET /pagamentos/1/edit
  def edit
    @cliente = Cliente.find(params[:cliente_id])
    @pagamento = @cliente.pagamentos.find(params[:id])
  end

  # POST /pagamentos
  # POST /pagamentos.xml
  def create
    @cliente = Cliente.find(params[:cliente_id])
    @pagamento = @cliente.pagamentos.build(params[:pagamento])

    respond_to do |format|
      if @pagamento.save
        format.html { redirect_to(cliente_pagamentos_path(@cliente), :notice => 'Pagamento foi criado com sucesso.') }
        format.xml  { render :xml => @pagamento, :status => :created, :location => @pagamento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pagamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pagamentos/1
  # PUT /pagamentos/1.xml
  def update
    @cliente = Cliente.find(params[:cliente_id])
    @pagamento = @cliente.pagamentos.find(params[:id])

    respond_to do |format|
      if @pagamento.update_attributes(params[:pagamento])
        format.html { redirect_to(cliente_pagamentos_path(@cliente), :notice => 'Pagamento foi atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pagamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pagamentos/1
  # DELETE /pagamentos/1.xml
  def destroy
    @cliente = Cliente.find(params[:cliente_id])
    @pagamento = @cliente.pagamentos.find(params[:id])
    @pagamento.destroy
    respond_to do |format|
      format.html { redirect_to(cliente_pagamentos_path(@cliente), :notice => 'O pagamento foi excluido com sucesso') }
      format.xml  { head :ok }
    end
  end

  def search
    if params[:data].nil?
      dt = Time.now
    else      
      dt = DateTime.strptime(params[:data], "%d/%m/%Y").to_time
    end
    @pagamentos = Pagamento.dia(dt)
  rescue
    dt = Time.now
  end

end
