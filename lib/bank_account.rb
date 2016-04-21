class BankAccount

  attr_accessor :status, :balance
  attr_reader :name	
  
  def initialize(name, status = "open", balance = 1000)
  	@name = name
  	@status = status
  	@balance = balance
  end

  def deposit(amount)
  	self.balance += amount
  end

  def display_balance
  	"Your Balance is $#{self.balance}."
  end

  def valid?
  	if self.balance > 0 and self.status == "open"
  	  true
  	else
      false
  	end
  end

  def close_account
  	self.status = "closed"
  end
end