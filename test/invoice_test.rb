require_relative 'test_helper'
require './lib/invoice'
require './lib/invoice_repository'
require 'csv'

class InvoiceTest < Minitest::Test
  def setup
    @invoice_repository = InvoiceRepository.new
  end

  def test_it_has_more_than_nine_invoices
    assert repository.count > 9
  end

  def test_it_returns_a_random_invoice
    random_invoice = repository.random
    assert random_invoice
  end

  # def test_it_can_find_by_status
  #   result = repository.find_by_status.first('shipped')
  #   assert 1, result.count
  # end
  #
  # def test_it_can_find_all_by_status
  #   result = repository.find_all_by_status('shipped')
  #   assert 10, result.count
  # end
  #
  # def test_it_can_find_all_by_invoice_id
  #   result = repository.find_all_by_invoice_id('2')
  #   assert 2, result.count
  # end


end
