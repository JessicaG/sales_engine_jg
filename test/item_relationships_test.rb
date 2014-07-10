require './test/test_helper'
require 'pry'

class ItemRelationshipsTest < Minitest::Test
  attr_reader :engine
  def setup
    @engine = SalesEngine.new
    engine.startup
  end

  #invoice_items returns a collection of InvoiceItems associated with this object
  def test_invoice_return_associated_invoice_items
    item = engine.item_repository.find_by('id', 10)
    invoice_items = item.invoice_items
    assert [4, 6, 8], item.invoice_items.map(&:id)
  end

  #merchant returns an instance of Merchant associated with this object
  def test_merchant_returns_associated_items
    item = engine.item_repository.find_by('merchant_id', 1)
    merchant = item.merchant
    assert [1], item.merchant.id
  end

end
