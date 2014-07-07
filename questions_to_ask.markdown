


  # most_revenue(x) returns the top x merchant instances ranked by total revenue
  # we need to take each merchant and find out how much revnue they generated
  # and return the merchant with the most revenue

  # how do we find revenue by merchant??
  # items has a unit price and merchant_id
  # invoice_items have a invoice_id and a quantity

  # the paremeter is the number of merchants they want returned, who are the top sellers
  # def test_it_can_group_items_by_merchant_id
  #   # start by sorting by merchant_id
  #   sorted_by_merchant_id = engine.item_repository.items
  #   .sort_by { |items| items.merchant_id }
  #   items = sorted_by_merchant_id
  #   assert ['1', '33'], items.collect(&:merchant_id)
  #   # binding.pry
    # our data should like the data below
    # assert { 1=>[1, 6, 9], 33=>[4], 38=>[8], 41 =>[5], 44=>[7], 75=>[2],
    # 78=>[3], 86=>[10] }, grouped_items
    # 1, 6, 9, 4, 8, 5, 7, 2, 3, 10
  # end
  #
  # we need to have {item_id => [quantity*unit_price]} and {item_id=>merchant_id}
  # then [{merchant_id =>total_rev}, {}]
  # group_by mechant_id
  # merchant_id=> [item1total, item2total, item3total].reduce(:+) then .sort_by merchant.values
  #


  # def test_it_can_return_an_array_of_merchants_with_revenue
  # #   skip
  # #   #someway we need to loop through the merchants, and find the revenue for each one
  # #   merchant = engine.invoice_repository.find_by('merchant_id', '38')
  # #   invoices = engine.invoice_item_repository.find_by('invoice_id', '')
  # #
  #   # group_by[array_of_merchant_ids_in_our_invoices]
  #   revenue = Hash.new (0)  #-> merchant_name : total_revenue
  #   grouped_items = engine.item_repository.invoices.group_by{ |item| item.merchant_id }
  #   grouped_invoice_items = engine.invoice_item_repository.group_by{ |invoice_item| invoice_item.invoice_id}
  #   grouped_items.each do |item|
  #     grouped_invoice_items do |invoice_item|
  #       if item.id == invoice_item.invoice_id
  #         merchant_name = repository.find_by('id', item.merchant_id).name
  #         revenue[merchant_name] += invoice_item.quantity.to_i * invoice_item.unit_price.to_i
  #       end
  #     end
  # #   end
  #     #    it "returns the top n revenue-earners" do
  #     #   most = engine.merchant_repository.most_revenue(3)
  #     #   most.first.name.should == "Dicki-Bednar"
  #     #   most.last.name.should  == "Okuneva, Prohaska and Rolfson"
  #     # end
  #   most = engine.merchant_repository.merchant.most_revenue(1)
  #   # assert #'merchants_name',most.first.name
  # end


  # def test_items_has_the_correct_number_of_them
  #  merchant = engine.merchant_repository.find_by_name ('Kirlin, Jakubowski and Smitham')
  #  items = merchant.items
  #  merchant.items.should have(33).items
  # end
