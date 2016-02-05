class BankAccount
  attr_accessor :balance, :status, :amount
  attr_reader :name

  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(amount)
    @amount = amount
    self.balance += amount
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