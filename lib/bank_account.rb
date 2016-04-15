class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    self.status == 'open' && self.balance >= 1000
  end

  def close_account
    self.status = "closed"
  end
end