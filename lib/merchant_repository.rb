require_relative 'merchant'
require 'date'

class MerchantRepository
  attr_reader :engine,
              :merchants

  def initialize(engine, csv_dir)
    @engine              = engine
    @merchants           = []
    @merchant_repository ||= CSV.open(csv_dir + '/merchants.csv', headers: true, header_converters: :symbol)
    build_records(@merchant_repository)
  end

  def build_records(repository)
    @merchants = repository.map { |row| Merchant.new(row, self)}
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
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
        if value.class != Fixnum
          merchant.send(attribute).downcase == value.downcase
        else
          merchant.send(attribute) == value
        end
    end
  end

  def find_by_name(value)
    value
    find_by('name', value)
  end

  def find_by_id(value)
    value
    find_by('id', value)
  end

  def find_all_by(attribute, value)
    merchants.select do |merchant|
      NoAttributeError.new(attribute) if !merchant.respond_to?(attribute)
        if value.class != Fixnum
          merchant.send(attribute).downcase == value.downcase
        else
          merchant.send(attribute) == value
        end
    end
  end

  def find_all_by_name(value)
    find_all_by('name', value)
  end

  def all
    merchants
  end

  def most_revenue(value)
    all.sort_by { |merchant| merchant.revenue }.reverse[0...value]
  end

  def revenue(date)
    merchants.map { |merchant| merchant.revenue(date) }.reduce(0, :+)
  end

  def most_items(value)
    all.sort_by { |merchant| merchant.amount_sold }.reverse[0...value]
  end


end
