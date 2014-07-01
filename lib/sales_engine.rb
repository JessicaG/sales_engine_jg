require 'csv'
require_relative 'merchant_repository'
require_relative 'merchant'
require_relative 'customer_repository'
require_relative 'customer'
require_relative 'invoice_repository'
require_relative 'invoice'
require_relative 'item_repository'
require_relative 'item'
require_relative 'invoice_item_repository'
require_relative 'invoice_item'
# require_relative './transactions_repository'

class SalesEngine
  attr_reader :customer_repository,
              :merchant_repository,
              :customer_repository,
              :invoice_repository,
              :invoice_item_repository,
              :item_repository
              # :transaction_repository

  def startup
    @merchant_repository      = MerchantRepository.new
    @customer_repository      = CustomerRepository.new
    @invoice_repository       = InvoiceRepository.new
    @invoice_item_repository  = InvoiceItemRepository.new
    @item_repository          = ItemRepository.new

    # @transaction_repository   = TransactionRepository.new
  end


end
