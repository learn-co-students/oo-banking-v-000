class BankAccount
  
  attr_reader :name
  attr_accessor :balance, :status
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(amount)
    self.balance += amount # self.balance refers to the instance of the bank account. @balance += amount is okay too, but the first way is the best practice. balance += amount is incorrect because Ruby will think you are creating a new local method with the += sign after it.
  end
  
  def display_balance
    "Your balance is $#{self.balance}." # or #{balance} is okay because it's calling on the balance getter
  end
  
  def valid?
    if self.balance > 0 and self.status == "open"
      true
    else 
      false
    end 
  end
  # or just self.balance > 0 && self.status == "open" is okay
  
  def close_account
    self.status = "closed"
  end 
  
end
