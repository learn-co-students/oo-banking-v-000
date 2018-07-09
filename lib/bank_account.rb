require 'pry'


class BankAccount

attr_accessor :balance, :status

attr_reader   :name

def initialize(name, status = "open", balance = 1000)
  @name = name
  @balance = balance
  @status = status
end

def balance
  @balance
end

def status
  @status
end

def deposit(deposit)
  self.balance += deposit
end

def withdrawal(amount)
  self.balance -= amount
end


def display_balance
  "Your balance is $#{self.balance}."
end

def valid?
  if self.status == "open" && self.balance > 0
    true
  else
    false
  end
end

# def valid?
#   self.status == "open" && self.balance > 0 ? true : false
#   end

def close_account
  self.status = "closed"
end


end
