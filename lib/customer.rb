require 'date'

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
    repository.engine.invoice_repository.find_all_by('customer_id', customer)
  end

  def customer_names
    ["first_name"] + ["last_name"]
  end

  def paid_invoices
    invoices.find_all(&:successful_charge?)
  end

  def transactions
    customer = self.id
    repository.engine.transaction_repository.find_all_by('invoice_id', customer)
  end

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

  def most_items(value)
    all.sort_by{ |item| item.quantity_sold }.reverse[0...value]
  end

  def most_revenue(value)
    all.sort_by { |item| item.revenue }.reverse[0...value]
  end

end
