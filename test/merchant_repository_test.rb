require_relative 'test_helper'
require './lib/merchant_repository'
require './lib/merchant'
require './lib/no_attribute_error'
require 'csv'
require 'pry'

class MerchantRepositoryTest < Minitest::Test

  def repository
    @repository ||= MerchantRepository.new
  end

  def test_it_exists
    assert repository
  end

  def test_it_has_more_than_nine_merchants
    assert repository.count > 9
  end

  def test_it_returns_a_random_merchant
    random_merchant = repository.random
    assert random_merchant
  end

  def test_it_finds_single_merchant_by_attribute
    result = repository.find_by_name('Schroeder-Jerde') # returns an object with the name of "Schorder-Jerde"
    assert result
  end

  def test_it_can_find_all_by_name
    result = repository.find_all_by_name('Williamson Group')
    assert 2, result.count
    assert result
  end

end
