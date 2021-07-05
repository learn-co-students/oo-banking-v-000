require "pry"
class BankAccount
attr_accessor :status,:balance
attr_reader :name
@@all = []
def initialize(name)
  @name = name
  @balance = 1000
  @status = "open"
end

def deposit(deposit)
  @balance += deposit
end

def withdraw(withdrawl)
  @balance -= withdrawl
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

# def balance=(balance)
#    @balance
# end

def close_account
  self.status = "closed"
end

end
