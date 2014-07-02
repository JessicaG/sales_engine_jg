require './lib/item'
require 'date'

class ItemRepository

  def initialize(engine)
    @engine          = engine
    @items           = []
    @item_repository = CSV.open(
    './test/fixtures/items.csv', headers: true, header_converters: :symbol)
    build_records(@item_repository)
  end

  def build_records(repository)
    @items = repository.map { |row| Item.new(row, self) }
  end

  def random
    items.shuffle.pop
  end

  def count
    @items.count
  end

  def find_by(attribute, value)
    items.detect do |item|
      NoAttributeError.new(attribute) if !item.respond_to?(attribute)
      item.send(attribute).to_s.downcase == value.to_s.downcase
    end
  end

  def find_by_name(value)
    find_by('name', value)
  end

  def find_by_unit_price(value)
    find_by('unit_price', value)
  end

  def find_all_by(attribute, value)
    items.select do |item|
      NoAttributeError.new(attribute) if !item.respond_to?(attribute)
      item.send(attribute).to_s.downcase == value.to_s.downcase
    end
  end

  def find_all_by_name(value)
    find_all_by('name', value)
  end
  # items returns a collection of Item instances associated with that merchant
  # for the products they sell
  def find_items_by_merchant_name(merchant_name)
    # find the merchant_id by name
    merchant_id = self.engine.merchant_repository.find_by_name(merchant_name)
    items.find_by_all('merchant_id', merchant_id)
  end

  private
  attr_reader :items

end
