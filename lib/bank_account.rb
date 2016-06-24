class BankAccount
attr_accessor :balance, :status
attr_reader :name

def initialize(name)
  @name = name
  @balance = 1000
  @status = "open"
end

def deposit(num)
  @balance = @balance + num
end

def display_balance
  x=self.balance
  "Your balance is $#{x}."
end

def valid?
  if (self.balance > 0) && (self.status == "open") 
    true
  else 
    false
end
end

def close_account
  self.status = "closed"
end

end
