require_relative 'merchant'
class MerchantRepository
  attr_accessor :merchant_repository,
                :merchants
  def initialize
    @merchant_repository = CSV.open(
    './test/fixtures/merchants.csv', headers: true, header_converters: :symbol)
    @merchants = []
    build_records(merchant_repository)
  end

  def build_records(repository)
    # how are we building each new merchant ?????
    merchant_repository.each { |row| merchants <<  Merchant.new(row) }
  end
end
