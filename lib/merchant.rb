require 'date'
require 'bigdecimal'
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

  def revenue
    paid_invoices
    total_revenue = paid_invoices.reduce(0)
    # { |sum, paid_invoice| sum += paid_invoice.total_price }
    to_bigdecimal(total_revenue)
  end

  def to_bigdecimal(cents)
    x = cents.to_f / 100
    BigDecimal.new(x.to_s)
  end

  def paid_invoices
    invoices.select(&:successful_charge?)
  end
  #
  # def revenue(date= nil)
  #   invoices = successful_charge
  #   if date
  #     invoices = invoices.find_all { |invoice| invoice.updated_at == date }
  #   end
  #   invoices.collect(&:amount).reduce(0, :+)
  #
  # end

end
