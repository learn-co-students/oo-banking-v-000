class BankAccount

attr_accessor :status, :balance
attr_reader :name

  def initialize(name)
  @name = name
  @status = "open"
  @balance = 1000
  end
  
  def deposit(amount)
    self.balance += amount
  end
  
  def display_balance 
    return "Your balance is $#{self.balance}."
  end
  
  def valid?
    self.status == "open" && self.balance > 0
  end
  
  def close_account 
    self.status = "closed"
  end
    
  
end
