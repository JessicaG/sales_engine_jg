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

  def customer_names
    ["first_name"] + ["last_name"]
  end

  def paid_invoices
    invoices.find_all(&:successful_charge?)
  end

  #transactions returns an array of Transaction instances associated with the customer
  def transactions
    customer = self.id
    repository.engine.transaction_repository.find_all_by('invoice_id', customer)
  end

  ##favorite_merchant returns an instance of Merchant where the customer has conducted the most successful transactions
  def favorite_merchant
    repository.engine.merchant_repository.find_by_id(top_merchant)
  end

  def merchant_count
    paid_invoices.each_with_object(Hash.new(0))do |invoice, merchant_counts|
    merchant_counts[invoice.merchant_id] +=1
    end
  end

  def top_merchant
    merchant_count.max_by { |_, count| count }[0]
  end
  
end
