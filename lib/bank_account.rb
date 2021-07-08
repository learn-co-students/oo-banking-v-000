class BankAccount
  
  attr_reader :name
  
  attr_accessor :balance, :status

  def initialize(name)
    @balance = 1000
    @status = "open"
    @name = name
    
  end 
  
  def deposit(amount)
    @balance = @balance + amount
  end 
  
  def display_balance 
    "Your balance is $#{@balance}."
  end 
  
  def valid?
    balance > 0 && status == "open" #this is the cleaner version of the below
    
    #if self.balance > 0 && self.status == "open"
      #true 
    #elsif !(self.balance > 0) && self.status != "open" 
      #false 
    #end
  
  end 
  
  def close_account 
    @status = "closed"
  end 
end
