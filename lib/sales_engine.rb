require 'csv'
require_relative './merchant_repository'

class SalesEngine
  attr_reader :customer_repository,
              :merchant_repository,
              :customer_repository,
              :invoice_repository,
              :invoice_item_repository,
              :item_repository,
              :transaction_repository

  def startup
    @merchant_repository      = MerchantRepository.new
    @customer_repository      = CustomerRepository.new
    @invoice_repository       = InvoiceRepository.new
    @invoice_item_repository  = InvoiceItemRepository.new
    @item_repository          = ItemRepository.new
    @transaction_repository   = TransactionRepository.new
  end

end
