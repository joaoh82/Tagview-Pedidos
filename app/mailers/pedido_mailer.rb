class PedidoMailer < ActionMailer::Base
  default :from => "joao@mindbiz.com.br"
  
  def atualiza_status(pedido)
      @pedido = pedido
      mail(:to => "joaoh82@gmail.com",
           :subject => "Tagview - Mudança de status no seu pedido")
  end
end
