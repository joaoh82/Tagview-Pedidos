require 'test_helper'

class PedidoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Pedido.new.valid?
  end
end
