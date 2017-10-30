class BankAccount
  attr_reader :name
  attr_accessor :status, :deposit
  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end
  def deposit(amount)
    self.status += amount
  end
  def display_balance
    "Your balance is $#{self.balance}."
  end
  def valid?
    self.balance > 0 && self.status == "open"
  end
  def close_account
    self.status = "closed"
  end
end
