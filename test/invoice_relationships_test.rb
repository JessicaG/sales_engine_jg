require_relative 'test_helper'
require './lib/sales_engine'
require './lib/invoice'
require './lib/invoice_repository'
require './lib/invoice_item_repository'
require './lib/invoice_item'
require './lib/customer'
require './lib/customer_repository'
require './lib/merchant'
require './lib/merchant_repository'
require './lib/transaction'
require './lib/transaction_repository'
require './lib/no_attribute_error'

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
    assert 3, invoice.transactions.count
    # assert (what you expect, the thing your testing)
  end

end
