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

  def revenue(date= nil)
    if date.nil?
      total_revenue = paid_invoices.collect { |invoice| invoice.amount }.reduce(:+)
    else
      total_revenue = paid_invoices.select { |invoice| invoice.created_at == date }.collect { |invoice| invoice.amount }.reduce(:+)
    end
    to_bigdecimal(total_revenue)
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

  def unpaid_invoices
    invoices.select{ |invoice| invoice.unpaid? }
  end

  def customers_with_pending_invoices
    unpaid_invoices.collect{|invoice| invoice.customer}.uniq
  end

  #favorite_customer returns the Customer who has conducted the most successful transactions
  def favorite_customer
    repository.engine.customer_repository.find_by_id(top_customer)
  end
    # find all the customers that have paid invoices
    # return invoice objects
    # go through each invoice and count
    # return the first and last name of the customers
    # how do I determine what "most" is for successful transactions?

    # customer_count = paid_invoices.each_with_object(Hash.new(0))do |invoice, counts|
    # #increase counts by 1 for every succesful transaction
    #   counts[invoice.customer_id] +=1
    # end
    # top_customer = customer_count.max_by { | ,count| count }[0]
    # repository.engine.customer_repository.find_by(top_customer_id)
  # end

  def customer_count
    paid_invoices.each_with_object(Hash.new(0))do |invoice, counts|
    counts[invoice.customer_id] +=1
    end
  end

  def top_customer
    customer_count.max_by { |_, count| count }[0]
  end

end
