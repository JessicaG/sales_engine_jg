require 'csv'
require './test/test_helper'

class SalesEngineTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine ||= SalesEngine.new
  end

  def test_it_loads_the_files
    assert engine.startup
  end

  def test_repositories_exist
    engine.startup
    assert engine.merchant_repository
    assert engine.invoice_repository
    assert engine.item_repository
    assert engine.invoice_item_repository
    assert engine.customer_repository
    assert engine.transaction_repository
  end

  def test_it_can_talk_to_the_repository
    engine.startup
    merchant_repository = engine.merchant_repository
    assert_equal merchant_repository.engine, engine
  end

end
