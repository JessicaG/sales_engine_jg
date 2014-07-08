require 'date'
require 'pry'

class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :update_at,
              :repository

  def initialize(row, repository)
    @id          = row[:id].to_i
    @first_name  = row[:first_name]
    @last_name   = row[:last_name]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repository  = repository
  end

  def invoices
    customer = self.id
    #this will return an instance object of first_name Joey and assign his id to customer
    repository.engine.invoice_repository.find_all_by('customer_id', customer)
    # binding.pry

  end

end
