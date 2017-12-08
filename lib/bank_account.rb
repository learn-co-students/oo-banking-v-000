class BankAccount

  attr_accessor  :balance, :status
  attr_reader :name

def initialize(name)
  @name = name
  @balance = 1000
  @status = "open"
end

# def name=(name)
#   if name == nil or name.size == 0
#     raise ArgumentError.new('Everyone must have a name.')
#   end
#   @name = name
# end

def deposit(amount)
  @balance += amount
  @balance
end

def display_balance
  "Your balance is $#{balance}."
end

def valid?
  if status == "open" && balance > 0
    true
  else
    false
end
end

def close_account
  self.status = "closed"
end



end
