class BankAccount

attr_reader :name, :status, :balance

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
   if @status == "closed" || @balance < 1
     false
   else
     true
   end
end

end
