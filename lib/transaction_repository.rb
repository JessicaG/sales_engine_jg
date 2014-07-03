class TransactionRepository

  def initialize(engine)
    @engine                 = engine
    @transactions           = []
    @transaction_repository = CSV.open(csv_dir 'transactions.csv', headers: true, header_converters: :symbol)
    build_records(@transaction_repository)
  end

  def build_records(repository)
    @transactions = repository.map { |row| Transaction.new(row, self) }
  end

  def random
    transactions.shuffle.pop
  end

  def count
    transactions.count
  end

  def find_by(attribute, value)
    transactions.detect do |transaction|
      NoAttributeError.new(attribute) if !transaction.respond_to?(attribute)
      transaction.send(attribute).to_s.downcase == value.to_s.downcase
    end
  end

  def find_by_id(value)
    find_by('id', value)
  end

  def find_by_credit_card_number(value)
    find_by('credit_card_number', value)
  end

  def find_all_by(attribute, value)
    transactions.select do |transaction|
      NoAttributeError.new(attribute) if !transaction.respond_to?(attribute)
      transaction.send(attribute).to_s.downcase == value.to_s.downcase
    end
  end

  def find_all_by_result(value)
    find_all_by('result', value)
  end

  private
  attr_reader :transactions

end
