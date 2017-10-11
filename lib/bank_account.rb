require 'pry'
class BankAccount
  attr_accessor :balance, :status, :amount
  attr_reader :name
def initialize(name, balance = 1000, status = "open")
  @name = name
  @balance = balance
  @status = status
  @amount = 0


end

def deposit(amount)
balance =  @balance += amount
end
def display_balance
  "Your balance is $#{deposit(amount)}."
end
def valid?
  if status == "open" && balance >= 1
    true
  else
    false
end
end
def close_account
  self.status = "closed"
end
end
