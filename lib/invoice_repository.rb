require_relative 'invoice'
require 'pry'

class InvoiceRepository
  attr_reader :engine,
              :invoices

  def initialize(engine)
    @engine             = engine
    @invoices           = []
    @invoice_repository = CSV.open(
    './test/fixtures/invoices.csv', headers: true, header_converters: :symbol)
    build_records(@invoice_repository)
  end

  def build_records(repository)
    @invoices = repository.map { |row| Invoice.new(row, self) }
  end

  def find_by(attribute, value)
    invoices.detect do |invoice|
      NoAttributeError.new(attribute) if !invoice.respond_to?(attribute)
      invoice.send(attribute).downcase == value.downcase
    end
  end

  def find_by_status(value)
    value
    find_by('status', value)
  end

  def find_all_by(attribute, value)
    invoices.select do |invoice|
      NoAttributeError.new(attribute) if !invoice.respond_to?(attribute)
      invoice.send(attribute).downcase == value.downcase
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
