require_relative 'test_helper'
require 'csv'

class CustomerRepositoryTest < Minitest::Test

  def repository
    csv_dir='./test/fixtures'
    @repository ||= CustomerRepository.new(self, csv_dir)
  end

  def test_it_has_more_than_nine_customers
    assert repository.count > 9
  end

  def test_it_returns_a_random_customer
    random_customer = repository.random
    assert random_customer
  end

  def test_it_finds_single_customer_by_first_name
    result = repository.find_by_first_name('Joey')
    assert result.first_name, 'Joey'
  end

  def test_it_finds_a_single_id
    result = repository.find_by_id(7)
    assert 7, result.id
  end

  def test_it_can_find_all_by_last_name
    result = repository.find_all_by_last_name('Parker')
    assert 2, result.count
  end

end
