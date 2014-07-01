require_relative 'test_helper'
require './lib/invoice_item_repository'
require './lib/invoice_item'
require 'csv'
require 'pry'

class InvoiceItemTest < Minitest::Test

  # def repository
  #   @repository ||= InvoiceItemRepository.new
  # end
  #
  # def test_it_can_find_by_item_id
  #   result = repository.find_by_item_id('539')
  #   assert 1, result.count
  # end
  #
  # def test_it_can_find_by_quantity
  #   result = repository.find_by_quantity('5')
  #   assert 2, result.count
  # end
  #
  # def test_it_can_find_by_id
  #   result = repository.find_by_id('1')
  #   assert 1, result.count
  # end

end
