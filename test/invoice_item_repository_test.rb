require_relative 'test_helper'
require 'csv'

class InvoiceItemTest < Minitest::Test

  def repository
    csv_dir='./test/fixtures'
    @repository ||= InvoiceItemRepository.new(self, csv_dir)
  end

  def test_it_can_find_by_item_id
    assert repository.find_by_item_id(539)
  end


  def test_it_can_find_by_id
    assert repository.find_by_id(1)
  end

end
