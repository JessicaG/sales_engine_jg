require './test/test_helper'
require './lib/no_attribute_error'
require './lib/merchant'

class NoAttributeErrorTest < Minitest::Test

  def test_it_responds_to_is_true_if_there_is_a_valid_attribute
    merchant_data = {id: '1', name: 'target', created_at: '05/05/2014', updated_at: '04/35/2034' }
    merchant = Merchant.new(merchant_data)
    assert merchant.respond_to?('id')
    assert merchant.respond_to?('name')
  end

  def test_it_does_not_respond_if_there_is_not_a_valid_attribute
    merchant_data = {id: '1', name: 'target', created_at: '05/05/2014', updated_at: '04/35/2034' }
    merchant = Merchant.new(merchant_data)
    refute merchant.respond_to?('last_name')
    refute merchant.respond_to?('merchant_id')
  end

end
