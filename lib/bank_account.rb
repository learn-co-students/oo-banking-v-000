class BankAccount
  
  attr_reader :name
  attr_accessor :balance, :status
  
  def initialize(name)
  	@name = name
  	@balance = 1000
  	@status = "open"
  end
  
  def deposit(amt)
  	@balance += amt
  end
  
  def withdraw(amt)
  	@balance -= amt
  end
  
  def display_balance
  	"Your Balance is $#{self.balance}." 
  end
  
  def valid?
  	@balance > 0 && @status == 'open'
  end
  
  def close_account
  	@status = 'closed'
  end
  	
end