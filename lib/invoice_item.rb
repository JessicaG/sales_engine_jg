require 'bigdecimal'
require 'date'

class InvoiceItem

  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at

  def initialize(row, repository)
    @id           = row[:id]
    @item_id      = row[:item_id]
    @invoice_id   = row[:invoice_id]
    @quantity     = row[:quantity]
    @unit_price   = price_format(row[:unit_price])
    @created_at   = Date.parse(row[:updated_at]).to_s
    @updated_at   = Date.parse(row[:created_at]).to_s
    @repository   = repository
  end

  def price_format(price)
    x = price.to_f / 100
    BigDecimal.new(x.to_s)
  end

end
