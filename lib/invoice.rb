class Invoice

  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id             = row[:id]
    @cusomter_id    = row[:customer_id]
    @merchant_id    = row[:merchant_id]
    @status         = row[:status]
    @created_at     = row[:created_at]
    @updated_at     = row[:updated_at]
    @repository     = repository
  end

  def transactions
    invoice = self.id
    repository.engine.transaction_repository.find_all_by('invoice_id', invoice)
  end

  # def items
  #   invoice = self.id
  #   repository.engine.invoice_item_repository.find_all_by('invoice_item_id', invoice)
  # end

end
