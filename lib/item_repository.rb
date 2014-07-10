require_relative 'item'
require 'date'

class ItemRepository
  attr_reader :items,
              :engine
  def initialize(engine, csv_dir)
    @engine          = engine
    @items           = []
    @item_repository ||= CSV.open(csv_dir + '/items.csv',
    headers: true, header_converters: :symbol)
    build_records(@item_repository)
  end

  def build_records(repository)
    @items = repository.map { |row| Item.new(row, self) }
  end

  def inspect
    "#<#{self.class} #{@items.size} rows>"
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
        if value.class != Fixnum
          item.send(attribute).downcase == value.downcase
        else
          item.send(attribute) == value
        end
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
        if value.class != Fixnum
          item.send(attribute).downcase == value.downcase
        else
          item.send(attribute) == value
        end
    end
  end

  def find_all_by_name(value)
    find_all_by('name', value)
  end

  def all
    items
  end

  def most_revenue(value)
    all.sort_by { |item| item.revenue }.reverse[0...value]
  end

  def most_items(value)
    all.sort_by { |item| item.amount_sold }.reverse[0...value]
  end
end
