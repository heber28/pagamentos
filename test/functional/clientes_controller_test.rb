require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Cliente.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Cliente.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Cliente.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to cliente_url(assigns(:cliente))
  end

  def test_edit
    get :edit, :id => Cliente.first
    assert_template 'edit'
  end

  def test_update_invalid
    Cliente.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Cliente.first
    assert_template 'edit'
  end

  def test_update_valid
    Cliente.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Cliente.first
    assert_redirected_to cliente_url(assigns(:cliente))
  end

  def test_destroy
    cliente = Cliente.first
    delete :destroy, :id => cliente
    assert_redirected_to clientes_url
    assert !Cliente.exists?(cliente.id)
  end
end
