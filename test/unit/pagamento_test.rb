require 'test_helper'

class PagamentoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Pagamento.new.valid?
  end
end
