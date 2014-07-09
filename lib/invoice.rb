require 'date'

class Invoice

  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id             = row[:id].to_i
    @customer_id    = row[:customer_id].to_i
    @merchant_id    = row[:merchant_id].to_i
    @status         = row[:status]
    @created_at     = Date.parse(row[:updated_at]).to_s
    @updated_at     = Date.parse(row[:created_at]).to_s
    @repository     = repository
  end

  def transactions
    invoice = self.id
    repository.engine.transaction_repository.find_all_by('invoice_id', invoice)
  end

  def invoice_items
    invoice = self.id
    repository.engine.invoice_item_repository.find_all_by('invoice_id', invoice)
  end

  def items
    invoice_id = self.id
    invoice_items = repository.engine.invoice_item_repository
    .find_all_by('invoice_id', invoice_id)
    invoice_items.map do |invoice_item|
      repository.engine.item_repository.find_by('id', invoice_item.item_id )
    end
  end

  def customer
    # customer returns an instance of Customer associated with this object
    repository.engine.customer_repository.find_by('id', self.customer_id)
  end

  def merchant
    invoice = self.id
    repository.engine.merchant_repository.find_all_by('id', invoice)
  end

  def transactions
    repository.engine.transaction_repository.find_all_by('invoice_id', self.id)
  end

  def successful_charge?
    transactions.any?(&:successful?)
  end

  def unpaid?
    # transactions.any?(&:failed?)
    transactions.any? { |transaction| transaction.failed? }

  end

  def invoice_amount
    cents = invoice_items.reduce(0) { |sum , invoice_item | sum += invoice_item.total_price }
    # binding.pry
    to_bigdecimal(cents)
  end

  def quantity
    invoice_items.collect(&:quantity).reduce(0, :+)
  end

  def amount
    invoice_items.map(&:total_price).reduce(0, :+)
  end

  def to_bigdecimal(cents)
    cents.to_d / 100
  end

end
