class BankAccount
  attr_accessor :balance, :status 
  attr_reader :name
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(amount)
    @balance += amount
    @balance
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    self.status == "open" && self.balance > 0
  end
  
  def close_account
    self.status = "closed"
    self.status
  end
  
end
