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
    @id          = row[:id]
    @name        = row[:name]
    @description = row[:description]
    @unit_price  = row[:unit_price]
    @merchant_id = row[:merchant_id]
    @created_at  = Date.parse(row[:updated_at]).to_s
    @updated_at  = Date.parse(row[:created_at]).to_s
    @repository  = repository
  end

end
