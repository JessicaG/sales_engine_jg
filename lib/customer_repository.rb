class CustomerRepository
  @customer_repository = CSV.open(
  './test/fixtures/customers.csv', headers: true, header_converters: :symbol)

  customer_repository.each { |row| customer_repository << Customer.build(row) }
  customer_repository
end
