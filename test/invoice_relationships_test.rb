require './test/test_helper'
require 'pry'

class InvoiceRelationsTest <Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new
    engine.startup
  end

  def test_invoice_returns_associated_transactions
    invoice = engine.invoice_repository.find_by_id('4')
    transactions = invoice.transactions
    assert 3, invoice.transactions.count
  end

  def test_invoice_returns_associated_invoice_items
    invoice = engine.invoice_repository.find_by_id('4')
    invoice_items = invoice.invoice_items
    assert ['530','541','540'], invoice.invoice_items.map(&:invoice_id)
  end

  def test_invoice_returns_associated_items
    invoice = engine.invoice_repository.find_by_id('4')
    items = invoice.items
    assert 3, invoice.items.count
  end

  # customer returns an instance of Customer associated with this object
  def test_invoice_returns_associated_customer
    invoice = engine.invoice_repository.find_by('customer_id', '2')
    customers = invoice.customers
    assert ['9'], invoice.customers
  end

  # merchant returns an instance of Merchant associated with this object
  def test_invoice_returns_associated_merchants
    # this returns a merchant associated with the id 1
    invoice = engine.invoice_repository.find_by('merchant_id', '1')
    merchant = invoice.merchant
    assert ['1', '6', '9'], invoice.merchant
  end

end

# items returns a collection of associated Items by way of InvoiceItem objects
#   def test_invoice_returns_associated_invoice_items
#     invoice = engine.invoice.item_repository.find_all_by('4')
#     items = invoice.items
#     assert ['530','541','540'], invoice.invoice_items.map(&:item)
#     #matching the arrays from invoice items to items
#     # assert 530, 541, 540
#     #return an array invoice items with an invoice_id
#   end

#   # def test_item_returns_a_colleciton_of_associated_items
#   #   item = engine.repository.item.find_all_by('4')
#   #
#   #   #invoice has invoice items, take collection and map all items invoice.items.map & item
#   #   invoice.invoice_items.map(&:item) #is the same as this invoice.invoice_items.map { |i| i.item }
#   # end
