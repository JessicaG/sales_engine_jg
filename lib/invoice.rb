require 'date'
# require 'pry'

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
    @created_at     = Date.parse(row[:updated_at])
    @updated_at     = Date.parse(row[:created_at])
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
    most_recent_transaction =
    transactions.sort_by{ |transaction| transaction.created_at }.last
    return true if most_recent_transaction.nil?
    most_recent_transaction.failed?
  end

  def invoice_amount
    c = invoice_items.reduce(0) { |s , ii | s += ii.total_price }
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
