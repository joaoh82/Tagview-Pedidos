require 'test_helper'

class PedidosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Pedido.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Pedido.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Pedido.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to pedido_url(assigns(:pedido))
  end

  def test_edit
    get :edit, :id => Pedido.first
    assert_template 'edit'
  end

  def test_update_invalid
    Pedido.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Pedido.first
    assert_template 'edit'
  end

  def test_update_valid
    Pedido.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Pedido.first
    assert_redirected_to pedido_url(assigns(:pedido))
  end

  def test_destroy
    pedido = Pedido.first
    delete :destroy, :id => pedido
    assert_redirected_to pedidos_url
    assert !Pedido.exists?(pedido.id)
  end
end
