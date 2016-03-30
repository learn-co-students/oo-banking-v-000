class BankAccount
  attr_reader :name
  attr_accessor :balance, :status
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(amount)
    @balance += amount
  end
  
  def display_balance
    return "Your Balance is $#{@balance}."
  end
  
  def valid?
    validity = false
    if (@balance > 0) && (@status != "closed")
      validity = true
    end
    return validity
  end
  
  def close_account
    
    return @status = "closed"
  end
end