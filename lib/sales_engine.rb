require 'csv'

class SalesEngine
  attr_accessor :customer_repository,
                :merchant_repository,
                :customer_repository,
                :invoice_repository,
                :invoice_item_repository,
                :item_repository,
                :transaction_repository

  def initilaize
    @merchant_repository      = []
    @customer_repository      = []
    @invoice_repository       = []
    @invoice_item_repository  = []
    @item_repository          = []
    @transaction_repository   = []
  end

  def startup
    # refactor and make it look cleaner
    # is there a shorter way to do it? ie the way a rake file works with tests
    @customer_repository = CSV.open(
    './test/fixtures/customers.csv', headers: true, header_converters: :symbol)
    @invoice_repository = CSV.open(
    './test/fixtures/invoices.csv', headers: true, header_converters: :symbol)
    @invoice_item_repository = CSV.open(
    './test/fixtures/invoice_items.csv', headers: true, header_converters: :symbol)
    @item_repository = CSV.open(
    './test/fixtures/items.csv', headers: true, header_converters: :symbol)
    @merchant_repository = CSV.open(
    './test/fixtures/merchants.csv', headers: true, header_converters: :symbol)
    @transaction_repository = CSV.open(
    './test/fixtures/transactions.csv', headers: true, header_converters: :symbol)
  end

  def create_repositories
    customer_repository.each { |row| customer_repository << Customer.build(row) }
    customer_repository

    invoice_repository.each { |row| invoice_repository << Invoice.build(row) }
    invoice_repository

    invoice_item_repository.each { |row| invoice_item_repository << InvoiceItem.build(row) }
    invoice_item_repository

    item_repository.each { |row| item_repository << Item.build(row) }
    item_repository

    merchant_repository.each { |row| merchant_repository << Merchant.build(row) }
    merchant_repository

    transaction_repository.each { |row| transaction_repository << Transaction.build(row) }
    transaction_repository
  end




end
