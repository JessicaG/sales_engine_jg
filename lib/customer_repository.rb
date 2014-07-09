require_relative 'customer'
require 'date'

class CustomerRepository
  attr_reader :engine,
              :customers

  def initialize(engine, csv_dir)
    @engine              = engine
    @customers           = []
    @customer_repository ||= CSV.open(csv_dir + '/customers.csv', headers: true, header_converters: :symbol)
    build_records(@customer_repository)
  end

  def build_records(repository)
    @customers = repository.map { |row| Customer.new(row, self) }
  end

  def inspect
     "#<#{self.class} #{@customers.size} rows>"
  end

  def random
    customers.shuffle.pop
  end

  def count
    @customers.count
  end

  def find_by(attribute, value)
    customers.detect do |customer|
      NoAttributeError.new(attribute) if !customer.respond_to?(attribute)
        if value.class != Fixnum
          customer.send(attribute).downcase == value.downcase
        else
          customer.send(attribute) == value
        end
    end
  end

  def find_by_first_name(value)
    value
    find_by('first_name', value)
  end

  def find_by_last_name(value)
    find_by('last_name', value)
  end

  def find_by_id(value)
    find_by('id', value)
  end

  def find_all_by(attribute, value)
    customers.select do |customer|
      NoAttributeError.new(attribute) if !customer.respond_to?(attribute)
        if value.class != Fixnum
          customer.send(attribute).downcase == value.downcase
        else
          customer.send(attribute) == value
        end
    end
  end

  def find_all_by_first_name(value)
    find_all_by('first_name', value)
  end

  def find_all_by_last_name(value)
    find_all_by('last_name', value)
  end

  def top_customer_id
    engine.repository.invoice
  end


end
