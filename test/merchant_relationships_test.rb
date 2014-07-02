require './test/test_helper'
require './lib/sales_engine'
require './lib/item_repository'
require './lib/merchant_repository'
require './lib/merchant'
require './lib/item'

class MerchantRelationshipsTest < Minitest::Test
  attr_reader :engine
  def setup
    @engine = SalesEngine.new
    engine.startup
  end

  def test_it_can_find_items_by_merchant_name
    merchant = engine.merchant_repository.find_by_name('Schroeder-Jerde')
    items = merchant.items
    assert 5, items.count
    # this is an integration test......move it later
    # this should return 5 items
    # merchant_id = merchant_repository.find_by_name('Schroeder-Jerde').id
    # # how do we talk to our sales engine
    # # there is an instance attribute called engine
    # #heyyyyy engine do you have a repo for items?
    # items = engine.item_repository.find_all_by('merchant_id', merchant_id)
    # assert 5, items.count
  end

  #invoices returns a collection of Invoice instances associated with that
  # merchant from their known orders
  def test_it_can_return_invoices_by_merchant_name
    merchant = engine.merchant_repository.find_by_name('Schroeder-Jerde')
    invoices = merchant.invoices
    assert 3, invoices.count
  end

end
