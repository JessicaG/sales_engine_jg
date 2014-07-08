require 'date'

class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repository
  # probably passing in a hash for first paremeter and calling it like attributes when
  # we seperate parse and load
  def initialize(row, repository)
    @id         = row[:id].to_i
    @name       = row[:name]
    @created_at = Date.parse(row[:updated_at]).to_s
    @updated_at = Date.parse(row[:created_at]).to_s
    @repository = repository
  end

  def items
    merchant_id = self.id
    repository.engine.item_repository.find_all_by('merchant_id', merchant_id)
  end

  def invoices
    merchant_id = self.id
    repository.engine.invoice_repository.find_all_by('merchant_id', merchant_id)
  end

  def revenue
    merchant_id = self.id
    invoices = repository.engine.invoice_repository.find_all_by('merchant_id', merchant_id)
    transactions = invoices.map { |invoice| repository.engine.transaction_repository.find_all_by('invoice_id', invoice.id) }
    .select { |transaction| transaction[0].result == 'success' }
    invoice_items = transactions.map do |transaction|
       repository.engine.invoice_item_repository.find_by('invoice_id', transaction[0].invoice_id)
    end
    revenue = invoice_items.map { |invoice_item| invoice_items[0].quantity * invoice_items[0].unit_price  }
    .reduce(:+)
  end


end
