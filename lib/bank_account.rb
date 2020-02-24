class BankAccount

attr_accessor :balance, :status, :old_balance
attr_reader :name 

def initialize(name, balance = 1000, status = "open")
  @name = name 
  @balance = balance
  @status = status  
  @old_balance = balance 
end 

def deposit(amount)
  @balance += amount
  @balance
end 

def display_balance 
  "Your balance is $#{@balance}."
end 

def valid?
  balance > 0 && status == "open"
end 

def close_account
  @status = "closed"
end 

end
