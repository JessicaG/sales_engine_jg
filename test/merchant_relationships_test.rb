require './test/test_helper'
require 'pry'

class MerchantRelationshipsTest < Minitest::Test
  attr_reader :engine
  def setup
    @engine = SalesEngine.new
    engine.startup
  end

  def test_it_can_return_invoices_by_merchant_name
    merchant = engine.merchant_repository.find_by_name('Schroeder-Jerde')
    invoices = merchant.invoices
    assert 3, invoices.count
  end

  def test_it_can_find_items_by_merchant_name
    merchant = engine.merchant_repository.find_by_name('Schroeder-Jerde')
    items = merchant.items
    assert ['Item Qui Esse'], items.collect.count(&:name)
  end

  # def test_items_has_the_correct_number_of_them
  #  merchant = engine.merchant_repository.find_by_name ('Kirlin, Jakubowski and Smitham')
  #  items = merchant.items
  #  merchant.items.should have(33).items
  # end


end
