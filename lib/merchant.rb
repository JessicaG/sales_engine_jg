require 'date'
require 'bigdecimal'
require 'pry'
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
    repository.engine.invoice_repository.find_all_by('merchant_id', self.id)
  end

  # def revenue
  #   total_revenue = paid_invoices.collect { |invoice| invoice.amount }.reduce(:+)
  #   # reduce(0) { |sum, paid_invoice| sum += paid_invoice.total_price }
  #   to_bigdecimal(total_revenue)
  # end

  def revenue(date= nil)
    if date.nil?
      total_revenue = paid_invoices.collect { |invoice| invoice.amount }.reduce(:+)
    else
      total_revenue = paid_invoices.select { |invoice| invoice.created_at == date }.collect { |invoice| invoice.amount }.reduce(:+)
    end
    to_bigdecimal(total_revenue)
    # invoices = paid_invoices
    # if date
    #   invoices = invoices.find_all { |i| i.updated_at == date }
    # end
    # invoices.map(&:invoice_amount).reduce(0, :+)
  end

  def to_bigdecimal(cents)
    x = cents.to_i / 100.00
    BigDecimal.new(x.to_s)
  end

  def paid_invoices
    invoices.find_all(&:successful_charge?)
  end

  def customers
    invoices.collect{|invoice| invoice.customer}
  end

  ## In customer.rb
  def has_unpaid_invoice_for_merchant_id(id)
  end

  def unpaid_invoices
    # binding.pry
    invoices.select{ |invoice| invoice.unpaid? }
  end

  def customers_with_pending_invoices
    # find all my invoices
    # figure out which ones are unpaid
    # find the customers attached to those invoices
    # find the unique customers from that set
    unpaid_invoices.collect{|invoice| invoice.customer}.uniq


    #
    # failed_transactions = repository.engine.transaction_repository.all.select{ |transaction| !transaction.successful? }
    # failed_invoices =
    # invoices.select do |invoice|
    #   failed_transactions.each do |failed_transaction|
    #     invoice.id == failed_transaction.invoice_id
    #   end
    # end
    # binding.pry
    # customers =
    # failed_invoices.map do |failed_invoice|
    #   repository.engine.customer_repository.find_by('id', failed_invoice.customer_id)
    # end
  end
  #
  # def revenue(date= nil)
  #   invoices = successful_charge
  #   if date
  #     invoices = invoices.find_all { |invoice| invoice.updated_at == date }
  #   end
  #   invoices.collect(&:amount).reduce(0, :+)
  #
  # =>  end
end
