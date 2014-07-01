require 'date'
class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at

  def initialize(row)
    @id         = row[:id]
    @name       = row[:name]
    @created_at = Date.parse(row[:created_at]).strftime('%Y/%m/%d')
    @updated_at = Date.parse(row[:updated_at]).strftime('%Y/%m/%d')
  end
end
