require './test/test_helper'
require 'pry'

class TransactionRelationshipsTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new
    engine.startup
  end

  #invoice returns an instance of Invoice associated with this object
  def test_transcation_returns_associated_invoices
    transaction = engine.transaction_repository.find_by('invoice_id', '7')
    # binding.pry
    invoice = transaction.invoice
    assert ['6'], transaction.invoice
    # assert ['6'], transaction.invoice.map(&:invoice_id)
  end
end
