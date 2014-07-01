require './test/test_helper'
require './lib/item_repository'
require './lib/item'
require 'csv'

class ItemRepositoryTest < Minitest::Test

  def repository
    @repository ||= ItemRepository.new
  end

  def test_it_has_more_than_nine_items
    assert repository.count > 9
  end

  def test_it_returns_a_random_item
    random_item = repository.random
    assert random_item
  end

  def test_it_can_find_a_single_name
    result = repository.find_by_name('Item Expedita Fuga')
    assert result
  end

  def test_for_case_insensitive_by_name
    result = repository.find_by_name('ITEm EXPedita fuga')
    assert result
  end

end
