require 'bigdecimal'
require 'bigdecimal/util'
require 'date'

class InvoiceItem

  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id           = row[:id].to_i
    @item_id      = row[:item_id].to_i
    @invoice_id   = row[:invoice_id].to_i
    @quantity     = row[:quantity].to_i
    @unit_price   = row[:unit_price].to_i
    @created_at   = Date.parse(row[:updated_at]).to_s
    @updated_at   = Date.parse(row[:created_at]).to_s
    @repository   = repository
  end

  def invoice
    invoice = self.invoice_id
    repository.engine.invoice_repository.find_by('id', invoice)
  end

  def item
    invoice_item_item_id = self.item_id
    repository.engine.item_repository.find_by('id', invoice_item_item_id)
  end

  def to_bigdecimal(cents)
    cents.to_d / 100
  end

  def total_price
    unit_price * quantity
  end

  def successful?
    invoice.successful_charge?
  end

end
