class Pedido < ActiveRecord::Base
  attr_accessible :referencia, :qtde, :status
  
  validates_presence_of :referencia, :message => " é de preenchimento obrigatório."
  validates_presence_of :qtde, :message => " é de preenchimento obrigatório."
  validates_presence_of :status, :message => " é de preenchimento obrigatório."
  
end
