require 'date'

class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :update_at

  def initialize(row)
    @id          = row[:id]
    @first_name  = row[:first_name]
    @last_name   = row[:last_name]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
  end
  
end
