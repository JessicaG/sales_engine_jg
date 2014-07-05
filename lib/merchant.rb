require 'date'

class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id         = row[:id]
    @name       = row[:name]
    @created_at  = Date.parse(row[:updated_at]).to_s
    @updated_at  = Date.parse(row[:created_at]).to_s
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

end
