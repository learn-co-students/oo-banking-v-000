require 'pry'
class BankAccount
attr_accessor :balance, :status
attr_reader :name

def initialize(name)
  @name = name
  @balance = 1000
  @status = "open"
end

def deposit(money)
  @balance += money
end

def withdraw(money)
  @balance -= money
end

def display_balance
  return "Your balance is $#{@balance}."
end

def valid?
  if @balance > 0 && @status == "open"
    true
  else
    false
  end
end

def close_account
  @status = "closed"
end

end
