class BankAccount

  attr_accessor :balance, :status
  attr_reader :name 
  
  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance 
    @status = status 
  end
   
  def deposit(amount)
    @balance = @balance + amount  
  end
  
  def display_balance
    "Your balance is $#{balance}."
  end
  
  def valid?
    if @status == "open" && @balance > 0
      return true  
    else 
      return false 
    end
  end
  
  def self.balance 
    @balance 
  end 
    
    def close_account
      @status = "closed" 
    end 
     
end
