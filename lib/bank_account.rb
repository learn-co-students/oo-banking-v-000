class BankAccount
  
  attr_accessor :balance, :status
  attr_reader :name


  def initialize(name, balance = 1000, status = "open")
    @name = name
    self.balance = balance
    self.status = status
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    self.status = "closed"
    self.balance = 0
  end

end