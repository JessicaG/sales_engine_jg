require 'date'

class Transaction
  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card,
              :expiration_date,
              :result,
              :created_at,
              :update_at,
              :repository

  def initialize(row, repository)
    @id                            = row[:id].to_i
    @invoice_id                    = row[:invoice_id].to_i
    @credit_card_number            = row[:credit_card_number]
    @credit_card_expiration_date   = row[:credit_card_expiration_date]
    @result                        = row[:result]
    @created_at                    = Date.parse(row[:updated_at]).to_s
    @updated_at                    = Date.parse(row[:created_at]).to_s
    @repository                    = repository
  end

  def invoice
    transaction = self.id
    repository.engine.invoice_repository.find_by('id', transaction)
  end

  def successful?
    result == "success"
  end

  def failed?
    result == "failed"
  end

end
