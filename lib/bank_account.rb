class BankAccount
  
  attr_accessor :bank_acct, :balance, :status
  attr_reader :name

def initialize(name)
  @bank_acct = bank_acct
  @name = name
  @balance = 1000
  @status = "open"
end

def deposit(money)
  self.balance += money
end

def display_balance
  return "Your balance is $#{balance}."
end

def valid?
  if @status == "open" && @balance > 0
   true
 else
   false
  end
end

end
