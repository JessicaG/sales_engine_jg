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
    repository.each { |row| @merchants <<  Merchant.new(row) }
  end

  def random
    merchants.shuffle.pop
  end

  def count
    @merchants.count
  end

  def find_by(attribute, value)
    merchants.detect do |merchant|
      merchant.send(attribute) == value
    end
  end

  def find_by_name(value)
    value
    find_by('name', value)
  end

  def find_by_id(value)
    find_by('id', value)
  end

  def find_by_created_at(value)
    # need to figure out how to convert to the date/time in the csv
    formatted_date = Date.parse(value).strftime('%Y/%m/%d')
    find_by('created_at', formatted_date)
  end

  def find_by_updated_at(value)
    formatted_date = Date.parse(value).strftime('%Y/%m/%d')
    find_by('updated_at', formatted_date)
  end

  def find_all_by(attribute, value)
    merchants.select do |merchant|
      merchant.send(attribute) == value
    end
  end

  def find_all_by_name(value)
    find_all_by('name', value)
  end

  def find_all_by_created_at(value)
    formatted_date = Date.parse(value).strftime('%Y/%m/%d')
    find_all_by('created_at', formatted_date)
  end

  def find_all_by_updated_at(value)
    formatted_date = Date.parse(value).strftime('%Y/%m/%d')
    find_all_by('updated_at', formatted_date)
  end

  private
  attr_reader :merchants
end
