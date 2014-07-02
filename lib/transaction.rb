class Transaction
  attr_reader :id,
              :invoice_items,
              :credit_card_number,
              :credit_card,
              :expiration_date,
              :result,
              :created_at,
              :update_at,
              :repository

  def initialize(row, repository)
    @id                 = row[:id]
    @invoice_items      = row[:invoice_items]
    @credit_card_number = row[:credit_card_number]
    @credit_card        = row[:credit_card]
    @expiration_date    = row[:expiration_date]
    @result             = row[:result]
    @created_at         = row[:created_at]
    @update_at          = row[:update_at]
    @repository         = repository
  end

end
