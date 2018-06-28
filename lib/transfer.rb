require 'pry'
class Transfer
attr_reader  :sender, :receiver
attr_accessor :status, :amount

def initialize(sender,receiver,amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
end

def valid?
sender.valid? && receiver.valid?
end

def execute_transaction
  if self.valid? == false || self.amount > sender.balance
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."

  elsif self.status == "pending"
  sender.balance -= self.amount
  receiver.balance += self.amount
  self.status = "complete"
  end
end


def reverse_transfer
  if self.status == "complete"
    sender.balance += self.amount
    receiver.balance -= self.amount
    self.status = "reversed"
  end
end









end
