class BankAccount
  
  attr_accessor :bank_acct, :balance, :status
  attr_reader :name

def initialize(name)
  @bank_acct = bank_acct
  @bank_acct = []
  @name = name
  @balance = 1000
  @status = "open"
end

def deposit(money)
  @bank_acct << money
end
end
