class BankAccount
  attr_reader :name
  attr_accessor :balance, :status
  
  def initialize (name)
    @name = name 
    @balance = 1000
    @status = "open"
  end
  
  def deposit (deposit_value)
    self.balance += deposit_value
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    0 < @balance && @status == "open"
  end
  
  def close_account
    self.status = "closed"
  end
end
