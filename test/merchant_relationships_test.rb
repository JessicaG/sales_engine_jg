require_relative './test_helper'
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

  def test_it_can_return_total_revenue_for_merchants
    merchant = engine.merchant_repository.find_by('name', 'Schroeder-Jerde')
    revenue = merchant.revenue
    assert 1080219, revenue
  end

  #revenue(date) returns the total revenue for that merchant for a specific invoice date
  def test_it_can_find_revenue_for_a_merchant_by_date
    skip
    date = Date.parse "2012-03-27"
    revenue = @repository.revenue(date)
    assert reveue >= BigDecimal.new("")
  end
  
end
