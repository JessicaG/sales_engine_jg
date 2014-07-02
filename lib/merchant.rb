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
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @repository = repository
  end

  # how does .items work on merchant according to the spec harness?

  def items
    # find the merchant_id by name
    merchant_id = self.id
    # this should return an array of items that match a merchant_id
    repository.engine.item_repository.find_all_by('merchant_id', merchant_id)
  end

  def invoices
    merchant_id = self.id
    repository.engine.invoice_repository.find_all_by('merchant_id', merchant_id)
  end


end
