class BankAccount
  
  attr_accessor :balance, :status 
  attr_reader :name
 
 def initialize(name)
   @name = name     #initializes with a name
   @balance = 1000  #always initializes with balance of 1000
   @status = "open"  #always initializes with a status of 'open'
 end 
 
  def deposit(cash)   #can deposit money into its account
    @balance += cash
    
  end 
  
  def display_balance #can display its balance
     "Your balance is $#{@balance}."
  end 
  
  def valid? 
      @status == "open" && @balance > 0 ? true : false
  #if @status == "open" && @balance > 0  
   # true 
  #else 
    #false 
   #end 
  end 
  
  def close_account
  @status = "closed"
  
 end 
  
  
 
end
