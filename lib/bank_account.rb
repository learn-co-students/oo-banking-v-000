class BankAccount

attr_accessor :balance, :status
attr_reader :name

def initialize(name)
  @name = name
  @balance = 1000
  @status = "open"
end

def deposit(deposit_amount)
# can deposit money into its account
self.balance += deposit_amount
end

def display_balance
   # can display its balance
   "Your balance is $#{balance}."
end

def valid?
  #is valid with an open status and a balance greater than 0
   @status == "open" && @balance > 0
end

def close_account
self.status = "closed" # can close its account
end

end#ends class
