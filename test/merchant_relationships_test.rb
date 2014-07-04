require './test/test_helper'
require 'pry'

class MerchantRelationshipsTest < Minitest::Test
  attr_reader :engine
  def setup
    @engine = SalesEngine.new
    engine.startup
  end

  # def test_it_can_find_items_by_merchant_name
  #   merchant = engine.merchant_repository.find_by_name('Schroeder-Jerde')
  #   items = merchant.items
  #   assert [''], items.count
  # end

  def test_it_can_return_invoices_by_merchant_name
    merchant = engine.merchant_repository.find_by_name('Schroeder-Jerde')
    invoices = merchant.invoices
    # binding.pry
    assert 3, invoices.count
  end

  def test_it_can_find_items_by_merchant_name
    merchant = engine.merchant_repository.find_by_name('Schroeder-Jerde')
    items = merchant.items
    binding.pry
    assert ['Item Qui Esse', 'Item Autem Minima', 'Item Ea Voluptatum', 'Item Nemo Facere','pooper scooper'], items.collect(&:name)
    # assert 3, items.count
  end


end
