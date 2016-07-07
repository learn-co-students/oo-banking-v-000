require 'pry'

class Transfer

attr_reader :receiver, :sender, :amount
attr_accessor :status

def initialize(sender, receiver, amount)
  @receiver = receiver
  @sender = sender
  @amount = amount
  @status = "pending"
end

def valid?
  if self.receiver.valid? && self.sender.valid? == true
    return true
  else
    return false
  end
end

def execute_transaction
  while @status != "complete"
    if self.valid? == true && self.sender.balance > @amount
      self.receiver.balance += @amount
      self.sender.balance -= @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
end

def reverse_transfer
  if @status == "complete"
    self.receiver.balance -= @amount
    self.sender.balance += @amount
    @status = "reversed"
  end
end

end
