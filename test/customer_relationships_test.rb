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
    customer = engine.customer_repository.find_by_first_name('Joey')
    invoices = customer.invoices
    assert ['1', '2', '3', '4', '5', '6', '7', '8'], customer.invoices.map.count(&:customer_id)
  end

  def test_invoices_can_return_a_single_customer_id_that_is_an_integer
    customer = engine.customer_repository.find_by_id('3')
    invoices = customer.invoices
    assert_equal 3, invoices
  end

end
