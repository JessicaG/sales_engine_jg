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
    transaction = engine.transaction_repository.find_all_by('transaction_id', transaction_id)
    invoice = transaction.invoices
    assert [''], transaction.invoice.map(&:item)
  end
