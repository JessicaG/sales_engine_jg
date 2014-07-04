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
    invoice_items = engine.invoice_item_repository.find_all_by('id', invoice_id)
    invoice = invoice_items.items
    assert [''], invoice_items.items.map(&:item)
  end

  #merchant returns an instance of Merchant associated with this object
  def test_merchant_returns_associated_items
    item = engine.item_repository.find_by_name('Shroeder-Jerde')
    merchant = item.merchants
    assert [''], item.merchants.map(&:name)
  end

end
