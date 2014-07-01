require_relative 'invoice_item'
require 'pry'

class InvoiceItemRepository

  def initialize
    @invoice_item_repository = CSV.open(
    './test/fixtures/invoice_items.csv', headers: true, header_converters: :symbol)
    @invoice_items = []
    build_records(@invoice_item_repository)
  end

  def build_records(repository)
    @invoice_items = repository.map { |row| InvoiceItem.new(row) }
  end

  def find_by(attribute, value)
    invoice_items.detect do |invoice_item|
      NoAttributeError.new(attribute) if !invoice_item.respond_to?(attribute)
      invoice_item.send(attribute).downcase == value.downcase
    end
  end

  def find_by_quantity(value)
    value
    find_by('quantity', value)
  end

  def find_by_id(value)
    value
    find_by('id', value)
  end

  def find_by_item_id(value)
    value
    find_by('item_id', value)
  end

  private
  attr_reader :invoice_items
end
