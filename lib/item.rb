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
    @unit_price  = row[:unit_price].to_i
    @merchant_id = row[:merchant_id].to_i
    @created_at  = Date.parse(row[:updated_at])
    @updated_at  = Date.parse(row[:created_at])
    @repository  = repository
  end

  def invoice_items
    repository.engine.invoice_item_repository.find_all_by('item_id', self.id)
  end

  def merchant
    repository.engine.merchant_repository.find_by('id', self.merchant_id)
  end

  def best_day
    invoices = invoice_items.map { |invoice_item| invoice_item.invoice }
    best_invoice =
      invoices.max_by do |invoice|
        invoices.each do |i|
          if invoice.id == i.id
            invoice.amount + i.amount
          else
            invoice.amount
          end
        end
      end
    best_invoice.created_at
  end
end
