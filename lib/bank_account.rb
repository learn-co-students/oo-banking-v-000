class BankAccount
  attr_accessor :balance, :status, :deposit
  attr_reader :name 
  @deposit = 0

def initialize(name)
  @name = name 
  @balance = 1000
  @status = "open"
end 

def deposit(deposit)  
    @balance += deposit   
end

def withdraw(deposit)  
    @balance -= deposit   
end

def display_balance
  "Your balance is $#{@balance}." 
end 

def valid?
  if @status == "open" && @balance > 0
    true
  else
    false
  end 
end

def close_account
  @status = "closed"
end 

end
