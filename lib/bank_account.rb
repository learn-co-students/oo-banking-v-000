class BankAccount
  attr_reader :name
  attr_accessor :balance, :status, :bank_account

def initialize(name)
  @name = name
  @balance = 1000
  @status = "open"
  @bank_account = bank_account
end
def valid?
  @status == "open" && @balance > 0
end
def close_account
  @status = "closed"
end
def deposit(money)
  @balance += money
end
def display_balance
  "Your balance is $#{balance}."
end
end