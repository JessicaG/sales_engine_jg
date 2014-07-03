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
    assert 3, invoice.transactions.count
    # assert (what you expect, the thing your testing)
  end

end
