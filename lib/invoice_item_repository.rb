class ItemRepository

@invoice_item_repository = CSV.open(
'./test/fixtures/invoice_items.csv', headers: true, header_converters: :symbol)


invoice_item_repository.each { |row| invoice_item_repository << InvoiceItem.build(row) }
invoice_item_repository

end
