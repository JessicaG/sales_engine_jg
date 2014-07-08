require_relative 'invoice'

class InvoiceRepository
  attr_reader :engine,
              :invoices,
              :customers

  def initialize(engine, csv_dir)
    @engine             = engine
    @invoices           = []
    @invoice_repository ||= CSV.open(csv_dir + '/invoices.csv', headers: true, header_converters: :symbol)
    build_records(@invoice_repository)
  end

  def build_records(repository)
    @invoices = repository.map { |row| Invoice.new(row, self) }
  end

  def inspect
    "#<#{self.class} #{@invoices.size} rows>"
  end

  def random
    all.sample
  end

  def all
    @invoices
  end

  def find_by(attribute, value)
    invoices.detect do |invoice|
      NoAttributeError.new(attribute) if !invoice.respond_to?(attribute)
        if value.class != Fixnum
          invoice.send(attribute).downcase == value.downcase
        else
          invoice.send(attribute) == value
        end
    end
  end

  def find_by_status(value)
    value
    find_by('status', value)
  end

  def find_all_by(attribute, value)
    invoices.select do |invoice|
      NoAttributeError.new(attribute) if !invoice.respond_to?(attribute)
        if value.class != Fixnum
          invoice.send(attribute).downcase == value.downcase
        else
          invoice.send(attribute) == value
        end
    end
  end

  def find_all_by_status(value)
    find_all_by('status', value)
  end

  def find_all_by_id(value)
    find_all_by('id', value)
  end

  def find_by_id(value)
    find_by('id', value)
  end



end
