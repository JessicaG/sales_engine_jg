require './test/test_helper'

class InvoiceRelationsTest <Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new
    engine.startup
  end
#transactions returns a collection of associated Transaction instances

  def test_invoice_returns_associated_transactions
    invoice = engine.invoice_repository.find_by_id('4') #-> <invoice #3u450823409823408>
    # .transaction going to be the method you call on invoice
    # it should give you the transactions associated with the invoice
    #when transactions called on invoice, use value passed in to find associated transatctions in repo
    transactions = invoice.transactions
    assert 3, invoice.transactions.count
    # assert (what you expect, the thing your testing)
  end

  def test_invoice_returns_associated_items
    invoice = engine.invoice_repository.find_by_id('4')
    items = invoice.item
    assert 3, invoice.item.count
  end

  def test_invoice_returns_associated_invoice_items
    engine.invoice.item_repository

    #matching the arrays from invoice items to items
    # assert 530, 541, 540
    #return an array invoice items with an invoice_id
  end

  def test_item_returns_a_colleciton_of_associated_items
    item =
    #invoice has invoice items, take collection and map all items invoice.items.map & item
    invoice.invoice_items.map(&:item) #is the same as this invoice.invoice_items.map { |i| i.item }
  end


end

# items returns a collection of associated Items by way of InvoiceItem objects
# customer returns an instance of Customer associated with this object
# merchant returns an instance of Merchant associated with this object
