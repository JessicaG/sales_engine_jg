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

  #most_revenue(x) returns the top x merchant instances ranked by total revenue
  # we need to take each merchant and find out how much revnue they generated
  # and return the merchant with the most revenue

  # how do we find revenue by merchant??
  # items has a unit price and merchant_id
  # invoice_items have a invoice_id and a quantity

  # the paremeter is the number of merchants they want returned, who are the top sellers

  def test_it_can_return_an_array_of_merchants_with_revenue
    # someway we need to loop through the merchants, and find the revenue for each one
    # merchant = engine.invoice_repository.find_by('merchant_id', '38')
    # invoices = engine.invoice_item_repository.find_by('invoice_id', '')

    #group_by[array_of_merchant_ids_in_our_invoices]
    

    assert # thismerchant.name, most_revenue(1)
  end


  # def test_items_has_the_correct_number_of_them
  #  merchant = engine.merchant_repository.find_by_name ('Kirlin, Jakubowski and Smitham')
  #  items = merchant.items
  #  merchant.items.should have(33).items
  # end


end
