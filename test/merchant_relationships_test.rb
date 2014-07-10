require_relative './test_helper'

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

  def test_it_can_return_total_revenue_for_merchants
    skip
    merchant = engine.merchant_repository.find_by('name', 'Schroeder-Jerde')
    revenue = merchant.revenue
    assert_equal 1080219, revenue
  end

  def test_it_can_return_revenue_for_merchants_by_date
    skip
    merchant = engine.merchant_repository.find_by('name', 'Schroeder-Jerde')
    revenue = merchant.revenue
    date = Date.parse "Tue, 20 Mar 2012"
    assert_equal BigDecimal.new(''), revenue
  end

  def test_it_can_return_customers_with_pending_invoices
    merchant = engine.merchant_repository.find_by('id', 10)
    assert_equal 'Mariah', merchant.customers_with_pending_invoices.first.first_name
  end

  def test_it_can_return_customer_with_most_successful_transactions_for_merchants
    merchant = engine.merchant_repository.find_by('id', 1)
    assert_equal 'Joey', merchant.favorite_customer.first.first_name
  end



end
