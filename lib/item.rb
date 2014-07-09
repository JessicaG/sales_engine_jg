require 'date'

class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id          = row[:id].to_i
    @name        = row[:name]
    @description = row[:description]
    @unit_price  = to_bigdecimal(row[:unit_price].to_i)
    @merchant_id = row[:merchant_id].to_i
    @created_at  = Date.parse(row[:updated_at]).to_s
    @updated_at  = Date.parse(row[:created_at]).to_s
    @repository  = repository
  end

  def invoice_items
    # invoice_items returns a collection of InvoiceItems associated with this object
    repository.engine.invoice_item_repository.find_all_by('item_id', self.id )
  end

  def merchant
    # merchant returns an instance of Merchant associated with this object
    repository.engine.merchant_repository.find_by('id', self.merchant_id)
  end

  def to_bigdecimal(cents)
    cents.to_d / 100
  end

end
