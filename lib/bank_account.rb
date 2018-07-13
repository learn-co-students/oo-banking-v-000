class BankAccount
  # class variable
  @@accounts = []
  
  # attribute accessors/readers
  attr_accessor :balance, :status
  attr_reader :name
  
  # instance methods
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@accounts << self
  end
  
  def close_account
    self.status = "closed"
  end
  
  def deposit(amount)
    @balance += amount
  end
  
  def display_balance
    "Your balance is $#{self.balance}."
  end 
  
  def valid?
    if self.balance > 0 && self.status == "open"
      true
    else
      false
    end
  end
  
  # class methods
end
