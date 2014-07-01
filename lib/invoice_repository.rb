require_relative 'invoice'
require 'pry'

class InvoiceRepository

  def initialize
    @invoice_repository = CSV.open(
    './test/fixtures/invoices.csv', headers: true, header_converters: :symbol)
    @invoices = []
    build_records(@invoice_repository)
  end

  def build_records(repository)
    @invoices = repository.map { |row| Invoice.new(row) }
  end

  def find_by(attribute, value)
    invoices.detect do |invoice|
      invoice.send(attribute) == value
    end
  end

  def find_by_status(value)
    value
    find_by('status', value)
  end

  def find_all_by(attribute, value)
    invoices.select do |invoice|
      invoice.send(attribute) == value
    end
  end

  def find_all_by_status(value)
    value
    find_by('status', value)
  end

  def find_all_by_id(value)
    find_all_by('id', value)
  end

  private
  attr_reader :invoices

end
