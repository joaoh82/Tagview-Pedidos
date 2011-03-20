class PedidoMailer < ActionMailer::Base
  default :from => "joao@mindbiz.com.br"
  
  def atualiza_status(pedido)
      @pedido = pedido
      mail(:to => "info@tagview.com.br",
           :subject => "Tagview - Mudança de status no seu pedido")
  end
end
