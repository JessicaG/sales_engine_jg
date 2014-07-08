require_relative 'test_helper'
require 'csv'

class MerchantRepositoryTest < Minitest::Test

  def repository
    csv_dir='./test/fixtures'
    @repository ||= MerchantRepository.new(self, csv_dir)
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

  def test_it_can_return_all_merchants
    assert 10, repository.all.count
  end

  def test_most_revenue_is_zero
    assert 0, repository.most_revenue(0)
  end

  # def test_most_revenue_returns_a_single_result
  #   # what algorithim do we use to find the merchant with the highest revenue?
  #   # we can reuse the revenue method on the merchant
  #   # find all merchants, sort by revenue, last
  #
  #   #repository.all.sort_by { |merchant| merchant.revenue }.reverse.take(x)
  #
  #   repository.all.sort_by { |merchant| merchant.revenue }.last
  #   assert [some_merchant], repository.most_revenue(1)
  # end

   def test_it_returns_all_revenue_for_a_specific_date
    date = Date.parse "Tue, 20 Mar 2012"
    revenue = repository.revenue(date)
    assert_equal BigDecimal.new("2549722.91"), revenue
  end
    #most_revenue(x) returns the top x merchant instances ranked by total revenue
end
