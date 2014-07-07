require './lib/merchant'
require 'date'

class MerchantRepository
  attr_reader :engine
  def initialize(engine, csv_dir)
    @engine              = engine
    @merchants           = []
    @merchant_repository = CSV.open(csv_dir + '/merchants.csv', headers: true, header_converters: :symbol)
    build_records(@merchant_repository)
  end

  def build_records(repository)
    @merchants = repository.map { |row| Merchant.new(row, self)}
  end

  def random
    merchants.sample
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

  
  attr_reader :merchants

end
