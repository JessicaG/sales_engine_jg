require 'csv'

class SalesEngine
  attr_reader :repostiories
  def initilaize
    @repositories = []
  end

  def startup
    # refactor and make it look cleaner
    # is there a shorter way to do it? ie the way a rake file works with tests
    customers = CSV.open(
    './test/fixtures/customers.csv', headers: true, header_converters: :symbol)
    invoices = CSV.open(
    './test/fixtures/invoices.csv', headers: true, header_converters: :symbol)
    invoice_items = CSV.open(
    './test/fixtures/invoice_items.csv', headers: true, header_converters: :symbol)
    items = CSV.open(
    './test/fixtures/items.csv', headers: true, header_converters: :symbol)
    merchants = CSV.open(
    './test/fixtures/merchants.csv', headers: true, header_converters: :symbol)
    transactions= CSV.open(
    './test/fixtures/transactions.csv', headers: true, header_converters: :symbol)
  end




end
