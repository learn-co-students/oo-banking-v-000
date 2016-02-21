class BankAccount
  # code here
  attr_accessor :balance, :status
  attr_reader :name
  def initialize(name)
    @balance = 1000
    @name = name
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0 ? true : false
  end

  def close_account
    self.status = "closed"
  end
end