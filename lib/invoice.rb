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
    invoice = self.id
    repository.engine.invoice_item_repository.find_all_by('item_id', invoice)
  end

  def customers
    invoice = self.id
    repository.engine.customer_repository.find_by('id', invoice)
  end

  def merchant
    invoice = self.id
    repository.engine.merchant_repository.find_all_by('id', invoice)
  end

  def successful_charge?
    repository.engine.transaction_repository.transactions.any?(&:successful?)
  end

  def amount
    repository.engine.invoice_item_repository.invoice_items.collect(&:total_price).reduce(0, :+)
  end

end
