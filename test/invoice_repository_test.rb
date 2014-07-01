require_relative 'test_helper'
require './lib/invoice_repository'
require './lib/invoice'
require 'csv'
require 'pry'

class InvoiceRepositoryTest < Minitest::Test
  def repository
    @repository ||= InvoiceRepository.new
  end

  def test_it_can_find_by_status
    assert repository.find_by_status('shipped')
  end

  def test_it_can_find_all_by_status
    assert repository.find_all_by_status('shipped')
  end

  def test_it_can_find_all_by_invoice_id
    assert repository.find_all_by_id('2')
  end

end
