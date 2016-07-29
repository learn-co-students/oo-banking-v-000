class BankAccount

attr_accessor :balance, :status
attr_reader :name
@@all = []

def initialize(name)
  @name = name
  @balance = 1000
  @status = "open"
  @@all << self
  Transfer.all_acct<< self
end

def self.all
  @@all
end

def deposit(amount)
@balance += amount
end

def display_balance
"Your balance is $#{self.balance}."
end

def valid?
  self.balance > 0 && self.status == "open"
end

def close_account
  self.status = "closed"
end

def self.transfer_acct_validation?(sender_acct, reciever_acct)
sender_acct.valid? && reciever_acct.valid?
end


end
