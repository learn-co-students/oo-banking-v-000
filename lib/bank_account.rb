class BankAccount
  # code here
  attr_reader :name
  attr_accessor :status, :balance

  @@account_holders = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
    @@account_holders << self
  end

  def display_balance
    "Your Balance is $#{balance}."
  end

  def deposit(amount)
    self.balance += amount
  end

  def valid?
    self.status == 'open' && self.balance > 0 ? true : false
  end

  def close_account
    self.status = 'closed'
  end

  def self.account_holders
    @@account_holders
  end

end