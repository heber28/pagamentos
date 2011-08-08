require 'test_helper'

class ClienteTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Cliente.new.valid?
  end
end
