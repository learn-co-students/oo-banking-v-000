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
  end
  
  def display_balance
    "Your Balance is $#{@balance}."
  end
  
  def valid?
    @validReturn = false
    
    if @status == "open" && @balance > 0
       @validReturn = true 
    end
    
    @validReturn
  end
  
  def close_account
    @status = "closed"
  end
end