require './test/test_helper'
require 'pry'

class InvoiceItemRelationshipsTest < Minitest::Test
  attr_reader :engine
  def setup
    @engine = SalesEngine.new
    engine.startup
  end

  #invoice returns an instance of Invoice associated with this object
  def test_invoice_return_associated_invoice_items
    invoice_items = engine.invoice_item_repository_find_all_by('id', invoice_id)
    invoice = invoice_items.items
    assert [''], invoice_items.items.map(&:item)
  end

  #item returns an instance of Item associated with this object
  ###look at spec harness
  def test_items_return_associated_invoice_items
    items = engine.invoice_item_repository_find_all_by('id', invoice_id)
    invoices = invoice_items.invoices
    assert [''], items.invoices.map(&:item)
  end

end
