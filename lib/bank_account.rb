class BankAccount
  attr_reader :name
  attr_accessor :balance, :status
  
  def initialize(name)
    @name = name
    self.balance = 1000
    self.status = "open"
  end  
  
  def deposit(money)
    self.balance += money
  end
  
  def display_balance
    return "Your balance is $#{self.balance}."
  end
  
  def valid? 
    if self.status == "open" && self.balance > 0 
      true 
    else
      false 
    end
  end
  def close_account
    self.status = "closed"
  end 
end
