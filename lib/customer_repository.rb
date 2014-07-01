require_relative 'customer'
require 'date'

class CustomerRepository

  def initialize
    @customer_repository = CSV.open(
    './test/fixtures/customers.csv', headers: true, header_converters: :symbol)
    @customers = []
    build_records(@customer_repository)
  end

  def build_records(repository)
    @customers = repository.map { |row| Customer.new(row) }
  end

  def random
    customers.shuffle.pop
  end

  def count
    @customers.count
  end

  def find_by(attribute, value)
    customers.detect do |customer|
      customer.send(attribute) == value
    end
  end

  def find_by_first_name(value)
    value
    find_by('first_name', value)
  end

  def find_by_last_name(value)
    find_by('last_name', value)
  end

  def find_by_id(value)
    find_by('id', value)
  end

  def find_all_by(attribute, value)
    customers.select do |customer|
      customer.send(attribute) == value
    end
  end

  def find_all_by_first_name(value)
    find_all_by('first_name', value)
  end

  def find_all_by_last_name(value)
    find_all_by('last_name', value)
  end

  private
  attr_reader :customers

end
