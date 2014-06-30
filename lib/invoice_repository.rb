class InvoiceRepository
  @invoice_repository = CSV.open(
  './test/fixtures/invoices.csv', headers: true, header_converters: :symbol)

  invoice_repository.each { |row| invoice_repository << Invoice.build(row) }
  invoice_repository

end
