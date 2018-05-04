class BankAccount

attr_accessor :balance, :status, :deposit, :money
attr_reader :name

def initialize(name)
  @name = name
  @balance = 1000
  @status = "open"
end

def deposit(money)
  @balance += money
end

def display_balance
  "Your balance is $#{@balance}."
end

def valid?
  if @status && @balance > 0
    true
  end
end

def close_account
end

end
