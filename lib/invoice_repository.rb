require './lib/invoice'

class InvoiceRepository
  attr_reader :engine,
              :invoices,
              :customers

  def initialize(engine, csv_dir)
    @engine             = engine
    @invoices           = []
    @invoice_repository = CSV.open(csv_dir + '/invoices.csv', headers: true, header_converters: :symbol)
    build_records(@invoice_repository)
  end

  def build_records(repository)
    @invoices = repository.map { |row| Invoice.new(row, self) }
  end

  def find_by(attribute, value)
    invoices.detect do |invoice|
      NoAttributeError.new(attribute) if !invoice.respond_to?(attribute)
      invoice.send(attribute).to_s.downcase == value.to_s.downcase
    end
  end

  def find_by_status(value)
    value
    find_by('status', value)
  end

  def find_all_by(attribute, value)
    invoices.select do |invoice|
      NoAttributeError.new(attribute) if !invoice.respond_to?(attribute)
      invoice.send(attribute).to_s.downcase == value.to_s.downcase
    end
  end

  def find_all_by_status(value)
    value
    find_by('status', value)
  end

  def find_all_by_id(value)
    find_all_by('id', value)
  end

  def find_by_id(value)
    find_by('id', value)
  end



end
