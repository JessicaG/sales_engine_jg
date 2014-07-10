require_relative 'invoice_item'

class InvoiceItemRepository
  attr_reader :invoice_items,
              :engine
  def initialize(engine, csv_dir)
    @engine                  = engine
    @invoice_items           = []
    @invoice_item_repository ||= CSV.open(csv_dir + '/invoice_items.csv',
    headers: true, header_converters: :symbol)
    build_records(@invoice_item_repository)
  end

  def random
    invoice_items.sample
  end

  def inspect
    "#<#{self.class} #{@invoice_items.size} rows>"
  end

  def build_records(repository)
    @invoice_items = repository.map { |row| InvoiceItem.new(row, self) }
  end

  def find_by(attribute, value)
    invoice_items.detect do |invoice_item|
      NoAttributeError.new(attribute) if !invoice_item.respond_to?(attribute)
        if value.class != Fixnum
          invoice_item.send(attribute).downcase == value.downcase
        else
          invoice_item.send(attribute) == value
        end
    end
  end

  def find_by_id(value)
    value
    find_by('id', value)
  end

  def find_by_item_id(value)
    value
    find_by('item_id', value)
  end

  def find_all_by(attribute, value)
    invoice_items.select do |invoice_item|
      NoAttributeError.new(attribute) if !invoice_item.respond_to?(attribute)
        if value.class != Fixnum
          invoice_item.send(attribute).downcase == value.downcase
        else
          invoice_item.send(attribute) == value
        end
    end
  end

  def find_all_by_quantity(value)
    find_all_by('quantity', value)
  end

end
