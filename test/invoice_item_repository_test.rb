require_relative 'test_helper'
require './lib/invoice_item_repository'
require './lib/invoice_item'
require 'csv'
require 'pry'

class InvoiceItemTest < Minitest::Test
  
  def repository
    @repository ||= InvoiceItemRepository.new
  end

  def test_it_can_find_by_item_id
    assert repository.find_by_item_id('539')
  end

  def test_it_can_find_by_quantity
    assert repository.find_by_quantity('5')
  end

  def test_it_can_find_by_id
    assert repository.find_by_id('1')
  end

end
