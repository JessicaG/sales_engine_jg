require './test/test_helper'
require 'pry'

class CustomerRelationshipsTest < Minitest::Test
  attr_reader :engine
  def setup
    @engine = SalesEngine.new
    engine.startup
  end

  #invoices returns a collection of Invoice instances associated with this object.
  def test_customer_returns_associated_invoices
    customer = engine.customer_repository_find_by_name('bob')
    invoices = customer.invoices
    assert [''], customer.invoices.map(&:item)
  end

end
