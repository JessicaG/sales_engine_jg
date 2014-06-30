require_relative 'test_helper'
require './lib/merchant'
require './lib/merchant_repository'
require 'csv'

class MerchantTest < Minitest::Test
  def setup
    @merchant_repository = MerchantRepository.new
  end

  def test_it_exists
    @merchant_repository
  end

  def test_name_attribute_exists
    @merchant_repository
    # looking for the name attribute in the merchants array
    assert @merchant_repository.merchants.first.name.match('Schroeder-Jerde')
  end

  def test_it_can_return_a_random_merchant
    @merchant_repository
    #checking if can return a merchant at random from the array
    assert @merchant_repository.merchants.name.random
  end
end
