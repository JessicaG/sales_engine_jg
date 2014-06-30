require 'csv'
require_relative 'test_helper'
require_relative '../lib/sales_engine'
require 'pry'

class SalesEngineTest < Minitest::Test
  def test_it_exists
    engine = SalesEngine.new
    assert engine
  end

  # def test_it_loads_a_file
  #   engine = SalesEngine.new
  #   filename = "./test/fixtures/merchants.csv"
  #   assert engine.startup(filename)
  # end

  def test_it_loads_the_files
    engine = SalesEngine.new
    assert engine.startup
  end

  def test_repositories_exist
    engine = SalesEngine.new
    engine.startup
    engine.create_repositories
    assert engine.merchant_repository
    assert engine.invoice_repository
    assert engine.item_repository
    assert engine.invoice_item_repository
    assert engine.customer_repository
    assert engine.transactions_repository
  end
end
