class BankAccount

attr_accessor :balance, :status
attr_reader :name

def initialize(name)
  @name = name
  @balance = 1000
  @status = "open"
end

def deposit(num)
  self.balance += num
end

def display_balance
  "Your balance is $#{self.balance}."
end

def valid?
  if self.balance <= 0 || self.status != "open"
    false
  else
    true
  end
end

def close_account
  self.status = "closed"
end

end
