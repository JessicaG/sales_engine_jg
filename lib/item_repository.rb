require './lib/item'
require 'date'

class ItemRepository

  def initialize
    @item_repository = CSV.open(
    './test/fixtures/items.csv', headers: true, header_converters: :symbol)
    @items = []
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

  private
  attr_reader :items

end
