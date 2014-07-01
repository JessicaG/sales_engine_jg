require_relative 'test_helper'
require './lib/merchant_repository'
require './lib/merchant'
require 'csv'
require 'pry'

class MerchantRepositoryTest < Minitest::Test
  def test_it_exists
    repository = MerchantRepository.new
    assert repository
  end

  def test_it_has_more_than_nine_merchants
    repository = MerchantRepository.new
    assert repository.count > 9
  end

  def test_it_returns_a_random_merchant
    repository = MerchantRepository.new
    random_merchant = repository.random
    assert random_merchant
  end

  def test_it_finds_single_merchant_by_attribute
    repository = MerchantRepository.new
    # find_by should return an instance of the Merchant object
    # depending on the attribute and the search value
    result = repository.find_by_name('Schroeder-Jerde') # returns an object with the name of "Schorder-Jerde"
    assert result.name, 'Schroeder-Jerde'
  end

  def test_it_can_find_a_created_at_date
    repository = MerchantRepository.new
    result = repository.find_by_created_at('April 21 2012')
    assert '2012/04/21', result.created_at
  end

  def test_it_can_find_all_by_name
    repository = MerchantRepository.new
    result = repository.find_all_by_name('Williamson Group')
    assert 2, result.count
  end

  def test_it_can_find_all_by_created_at
    repository = MerchantRepository.new
    result = repository.find_all_by_created_at('March 27 2012')
    assert result.count > 4
  end

end
