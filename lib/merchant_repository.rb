require_relative 'merchant'
require 'pry'

class MerchantRepository
  attr_accessor :merchant_repository,
                :merchants
  def initialize
    @merchant_repository = CSV.open(
    './test/fixtures/merchants.csv', headers: true, header_converters: :symbol)
    @merchants = []
    build_records(merchant_repository)
  end

  def build_records(repository)
    # how are we building each new merchant ?????
    merchant_repository.each { |row| merchants <<  Merchant.new(row) }
  end

  def random
    merchants.shuffle.pop
  end

  ##do we need to write a method for every attribute or can we make a super or unvieral one??
  def find_by(attribute, value)
    # find_by merchant attribute and return instance
    @merchants.detect do |merchant|
      merchant.send(attribute) == value
    end
  end

  def find_all_by(attribute, value)
    @merchants.select do |merchant|
      merchant.send(attribute) == value
    end
  end

end
