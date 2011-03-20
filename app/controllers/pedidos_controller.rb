class PedidosController < ApplicationController
  
  def atualiza_status
    
    @pedido = Pedido.find(params[:id])
    
    if @pedido.status == "Aberto"
      @pedido.status = "Aprovando pagamento"
      @pedido.save
      PedidoMailer.atualiza_status(@pedido).deliver
      flash[:notice] = "Status atualizado com sucesso!"
    elsif @pedido.status == "Aprovando pagamento"
      @pedido.status = "Fechado"
      @pedido.save
      PedidoMailer.atualiza_status(@pedido).deliver
      flash[:notice] = "Status atualizado com sucesso!"
    elsif @pedido.status == "Fechado"
      flash[:notice] = "Pedido já está fechado e status não pode ser mudado."
    end

    redirect_to pedidos_url
  end

  def index
    @pedidos = Pedido.all
  end

  def show
    @pedido = Pedido.find(params[:id])
  end

  def new
    @pedido = Pedido.new
  end

  def create
    @pedido = Pedido.new(params[:pedido])
    
    @pedido.status = "Aberto"
    
    if @pedido.save
      flash[:notice] = "Pedido criado com sucesso!"
      redirect_to @pedido
    else
      render :action => 'new'
    end
  end

  def edit
    @pedido = Pedido.find(params[:id])
  end

  def update
    @pedido = Pedido.find(params[:id])
    if @pedido.update_attributes(params[:pedido])
      flash[:notice] = "Pedido atualizado com sucesso!"
      redirect_to @pedido
    else
      render :action => 'edit'
    end
  end

  def destroy
    @pedido = Pedido.find(params[:id])
    @pedido.destroy
    flash[:notice] = "Pedido apagado com sucesso!"
    redirect_to pedidos_url
  end
end
