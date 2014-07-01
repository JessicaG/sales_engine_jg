require './test/test_helper'
require './lib/item_repository'
require './lib/item'
require 'csv'

class ItemRepositoryTest < Minitest::Test
  def test_it_has_more_than_nine_items
    repository = ItemRepository.new
    assert repository.count > 9
  end

  def test_it_returns_a_random_item
    repository = ItemRepository.new
    random_item = repository.random
    assert random_item
  end

  def test_it_can_find_a_single_name
    repository = ItemRepository.new
    result = repository.find_by_name('Item Expedita Fuga')
    assert result
  end

  def test_for_case_insensitive_by_name
    repository = ItemRepository.new
    result = repository.find_by_name('ITEm EXPedita fuga')
    assert result
  end

  def test_it_can_find_by_unit_price
    skip
    repository = ItemRepository.new
    result = repository.find_by_unit_price('75107')
    assert result
  end

  def test_it_can_find_all_by_the_name
    skip
    repository = ItemRepository.new
    result = repository.find_all_by_name('pooper scooper')
    assert 2, result.count
  end

end
