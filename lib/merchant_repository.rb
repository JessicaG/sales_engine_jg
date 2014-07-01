require_relative 'merchant'
require 'date'

class MerchantRepository

  def initialize
    @merchant_repository = CSV.open(
    './test/fixtures/merchants.csv', headers: true, header_converters: :symbol)
    @merchants = []
    build_records(@merchant_repository)
  end

  def build_records(repository)
    @merchants = repository.map { |row| Merchant.new(row)}
  end

  def random
    merchants.shuffle.pop
  end

  def count
    @merchants.count
  end

  def find_by(attribute, value)
    merchants.detect do |merchant|
      NoAttributeError.new(attribute) if !merchant.respond_to?(attribute)
      merchant.send(attribute) == value
    end
  end

  def find_by_name(value)
    value
    find_by('name', value)
  end

  def find_all_by(attribute, value)
    merchants.select do |merchant|
      NoAttributeError.new(attribute) if !merchant.respond_to?(attribute)
      merchant.send(attribute) == value
    end
  end

  def find_all_by_name(value)
    find_all_by('name', value)
  end

  private
  attr_reader :merchants

end
