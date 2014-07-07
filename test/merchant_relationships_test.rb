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

  #revenue returns the total revenue for that merchant across all transactions
  # def test_it_can_return_total_revenue_for_merchants_for_a_specific_date
  #   merchant = engine.invoice_item_repository.find_all_by('item_id')
  #   revenue = merchant.revenue
  #   assert [''], revenue.collect.count(&:id)
  #
  #   revenue = engine.invoice_item_repository.find_all_by('item_id')
  # end

end
