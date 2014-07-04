require './test/test_helper'

class InvoiceRelationsTest <Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new
    engine.startup
  end

  def test_invoice_returns_associated_transactions
    invoice = engine.invoice_repository.find_by_id('4')
    transactions = invoice.transactions
    assert 3, invoice.transactions.count
  end

  def test_invoice_returns_associated_items
    invoice = engine.invoice_repository.find_by_id('4')
    items = invoice.items
    assert 3, invoice.items.count
  end

  # items returns a collection of associated Items by way of InvoiceItem objects
  def test_invoice_returns_associated_invoice_items
    invoice = engine.invoice.item_repository.find_all_by('4')
    items = invoice.items
    assert ['530','541','540'], invoice.invoice_items.map(&:item)
    #matching the arrays from invoice items to items
    # assert 530, 541, 540
    #return an array invoice items with an invoice_id
  end

  # customer returns an instance of Customer associated with this object
  def test_invoice_customer_returns_associated_customer_instance
    invoice = engine.invoice_repository.find_by_id  ('2')

  end
  # merchant returns an instance of Merchant associated with this object
  def test_invoice_merchant_returns_associated_merchant_instance

  end

    #   describe "#customer" do
    #   it "exists" do
    #     invoice.customer.first_name.should == "Eric"
    #     invoice.customer.last_name.should  == "Bergnaum"
    #   end
    # end
  #
  # def test_item_returns_a_colleciton_of_associated_items
  #   item = engine.repository.item.find_all_by('4')
  #
  #   #invoice has invoice items, take collection and map all items invoice.items.map & item
  #   invoice.invoice_items.map(&:item) #is the same as this invoice.invoice_items.map { |i| i.item }
  # end

end
