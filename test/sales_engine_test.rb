require 'csv'
require_relative 'test_helper'
require_relative '../lib/customer_repository'
require_relative '../lib/invoice_repository'
require_relative '../lib/item_repository'
require_relative '../lib/invoice_item_repository'
require_relative '../lib/merchant_repository'
# require_relative '../lib/transactions_repository'
require_relative '../lib/sales_engine'
require 'pry'

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
    # assert engine.transactions_repository
  end

  # def test_it_loads_a_file
  #   engine = SalesEngine.new
  #   filename = "./test/fixtures/merchants.csv"
  #   assert engine.startup(filename)
  # end

end
