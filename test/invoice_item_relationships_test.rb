require './test/test_helper'

class InvoiceItemRelationshipsTest < Minitest::Test
  attr_reader :engine
  def setup
    @engine = SalesEngine.new
    engine.startup
  end

  #invoice returns an instance of Invoice associated with this object
  def test_invoice_return_associated_invoice_items
    invoice_items = engine.invoice_item_repository.find_by('invoice_id', 2)
    invoice = invoice_items.invoice
    assert [2], invoice_items.invoice
  end

  #item returns an instance of Item associated with this object
  #item_id of 10 in invoice_item should return the name pooper scooper
  ###look at spec harness
  def test_items_return_associated_invoice_items
    invoice_items = engine.invoice_item_repository.find_by('item_id', 10)
    item = invoice_items.item
    assert ['pooper scooper'], invoice_items.item.name
  end

end
