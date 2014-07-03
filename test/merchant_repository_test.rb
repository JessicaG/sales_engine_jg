require_relative 'test_helper'
require 'csv'

class MerchantRepositoryTest < Minitest::Test

  def repository
    @repository ||= MerchantRepository.new('engine')
  end

  def test_it_has_more_than_nine_merchants
    assert repository.count > 9
  end

  def test_it_returns_a_random_merchant
    random_merchant = repository.random
    assert random_merchant
  end

  def test_it_finds_single_merchant_by_attribute
    result = repository.find_by_name('Schroeder-Jerde')
    assert result
  end

  def test_it_can_find_all_by_name
    result = repository.find_all_by_name('Williamson Group')
    assert 2, result.count
    assert result
  end

  def test_it_can_talk_to_the_merchant
    assert repository, repository.random.repository
  end
end
