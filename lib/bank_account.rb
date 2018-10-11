class BankAccount
  
  attr_accessor :balance, :status, :all 
  attr_reader :name 
  
  @@all = []

def initialize(name)
  @name = name
  @balance = 1000
  @status = "open"
  @@all << self 
end

def display_balance
  return "Your balance is $#{@balance}."
end

def deposit(amount)
  self.balance = @balance + amount 
  self.balance 
end

def valid?
  if self.status == "open" && self.balance > 0
    true 
  else 
    false 
  end 
end

def close_account
  self.status = "closed"
end

end
