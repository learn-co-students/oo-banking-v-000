require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  @@all_acct = []

  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

def self.all_acct
  @@all_acct
end

def valid?
  sender = @sender
  receiver = @receiver
  transaction_status = BankAccount.transfer_acct_validation?(sender, receiver)
end

def execute_transaction
  if valid? == true && status != "complete" && @sender.balance > @amount
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  else
    @status = "rejected"
  end
  if @amount > @sender.balance 
    return "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete"
    @receiver.balance -= @amount
    @sender.balance += @amount
    @status = "reversed"
  end
end


end

