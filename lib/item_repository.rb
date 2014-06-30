class ItemRepository
@item_repository = CSV.open(
'./test/fixtures/items.csv', headers: true, header_converters: :symbol)

    item_repository.each { |row| item_repository << Item.build(row) }
    item_repository


end
