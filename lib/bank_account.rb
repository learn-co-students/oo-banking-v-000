class BankAccount
  attr_accessor  :balance, :status
  attr_reader :name, :sender, :receiver
  
def initialize(name)
  @name = name
  @balance = 1000
  @status = 'open'
end 

def deposit(amount)
  @balance = @balance + amount
end 

def display_balance
  return "Your balance is $#{@balance}."
end 

def valid?
  if self.balance > 0 && self.status == 'open'
    return true
  else 
    false
  end 
end 

def close_account
  self.status = 'closed'
end 

end
