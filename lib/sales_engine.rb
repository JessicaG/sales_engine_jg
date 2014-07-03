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

  def startup(self, csv_dir './test/fixtures')
    @merchant_repository      = MerchantRepository.new(self, csv_dir)
    @customer_repository      = CustomerRepository.new(self, csv_dir)
    @invoice_repository       = InvoiceRepository.new(self, csv_dir)
    @invoice_item_repository  = InvoiceItemRepository.new(self, csv_dir)
    @item_repository          = ItemRepository.new(self, csv_dir)
    @transaction_repository   = TransactionRepository.new(self, csv_dir)
  end

end
