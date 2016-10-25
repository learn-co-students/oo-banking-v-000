class BankAccount
  attr_reader :name
  attr_accessor  :balance, :status
def initialize(name)
  @name=name
  @balance=1000
  @status="open"
end

def deposit(amt)
  @balance=@balance + amt
end

def display_balance
"Your balance is $#{@balance}."
end

def valid?
return @status == "open" && @balance > 0
end

def close_account
@status = "closed"
end
end
