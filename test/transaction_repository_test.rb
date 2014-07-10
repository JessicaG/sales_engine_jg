require './test/test_helper'
require 'csv'

class TransactionRepositoryTest < Minitest::Test

  def repository
    csv_dir='./test/fixtures'
    @repository ||= TransactionRepository.new(self, csv_dir)
  end

  def test_it_has_more_than_nine_items
    assert repository.count > 9
  end

  def test_it_returns_a_random_item
    random_item = repository.random
    assert random_item
  end

  def test_it_can_find_by_credit_card_number
    assert repository.find_by_credit_card_number('4923661117104166')
  end

  def test_it_can_find_by_id
    assert repository.find_by_id(4)
  end

  def test_if_can_find_all_by_result
    assert repository.find_all_by_result('success').count > 5
  end

end
