class TransactionRepository
@transaction_repository = CSV.open(
'./test/fixtures/transactions.csv', headers: true, header_converters: :symbol)


transaction_repository.each { |row| transaction_repository << Transaction.build(row) }
transaction_repository

end
