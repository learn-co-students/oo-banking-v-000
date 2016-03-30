class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  @@accounts = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
    @@accounts << self
  end

  def self.accounts
    @@accounts
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
  end

  def display_balance
    "Your Balance is $#{@balance}."
  end

  def valid?
    @status == 'open' && @balance > 0
  end

  def close_account
    @status = 'closed'
  end
end