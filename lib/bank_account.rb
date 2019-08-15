class BankAccount

attr_reader :name
attr_accessor :status, :balance

def initialize(name)
  @name = name
  @balance = 1000
  @status = "open"
end

def deposit(money)
  @money = money
  @balance += @money
end

def display_balance
  "Your balance is $#{@balance}."
end

def valid?
 if @status == "open" && @balance > 0
   true
 else
   false
 end
end

def close_account
  @status = "closed"
end

end
