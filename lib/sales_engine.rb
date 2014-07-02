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
require_relative 'transaction_repository'
require_relative 'transaction'

class SalesEngine
  attr_reader :customer_repository,
              :merchant_repository,
              :customer_repository,
              :invoice_repository,
              :invoice_item_repository,
              :item_repository,
              :transaction_repository

  def startup
    @merchant_repository      = MerchantRepository.new(self)
    @customer_repository      = CustomerRepository.new(self)
    @invoice_repository       = InvoiceRepository.new(self)
    @invoice_item_repository  = InvoiceItemRepository.new(self)
    @item_repository          = ItemRepository.new(self)
    @transaction_repository   = TransactionRepository.new(self)
  end

end
