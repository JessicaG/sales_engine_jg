require './test/test_helper'
require 'csv'

class TransactionRepositoryTest < Minitest::Test
  def test_it_has_more_than_nine_items
    repository = TransactionRepository.new
    assert repository.count > 9
  end

  def test_it_returns_a_random_item
    repository = TransactionRepository.new
    random_item = repository.random
    assert random_item
  end

  def test_it_can_find_by_credit_card_number
    repository = TransactionRepository.new
    assert repository.find_by_credit_card_number('4923661117104166')
  end

  def test_it_can_find_by_id
    repository = TransactionRepository.new
    assert repository.find_by_id('4')
  end

  def test_if_can_find_all_by_result
    repository = TransactionRepository.new
    assert repository.find_all_by_result('success').count > 5
  end

end
