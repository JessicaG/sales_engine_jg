require 'csv'
require_relative '../lib/merchant_repository'
require_relative '../lib/invoice_repository'
require_relative '../lib/invoice_item_repository'
require_relative '../lib/customer_repository'
require_relative '../lib/transaction_repository'
require_relative '../lib/item_repository'

class SalesEngine
  attr_reader :customer_repository,
              :merchant_repository,
              :customer_repository,
              :invoice_repository,
              :invoice_item_repository,
              :item_repository,
              :transaction_repository,
              :csv_dir

  def initialize(csv_dir='./test/fixtures')
    @csv_dir = csv_dir
  end

  def startup
    @merchant_repository      = MerchantRepository.new(self, csv_dir)
    @customer_repository      = CustomerRepository.new(self, csv_dir)
    @invoice_repository       = InvoiceRepository.new(self, csv_dir)
    @invoice_item_repository  = InvoiceItemRepository.new(self, csv_dir)
    @item_repository          = ItemRepository.new(self, csv_dir)
    @transaction_repository   = TransactionRepository.new(self, csv_dir)
  end

end
