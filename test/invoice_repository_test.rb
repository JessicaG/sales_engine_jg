require_relative 'test_helper'
require 'csv'

class InvoiceRepositoryTest < Minitest::Test
  def repository
    csv_dir='./test/fixtures'
    @repository ||= InvoiceRepository.new(self, csv_dir)
  end

  def test_it_can_find_by_invoice_id
    assert repository.find_by('customer_id', 1)
  end

  def test_it_can_find_by_status
    assert repository.find_by_status('shipped')
  end

  def test_it_can_find_all_by_status
    assert repository.find_all_by_status('shipped')
  end

  def test_it_can_find_all_by_invoice_id
    assert repository.find_all_by_id(2)
  end

end
