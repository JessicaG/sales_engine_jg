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

end
