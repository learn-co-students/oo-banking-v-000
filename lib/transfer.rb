class Transfer
 attr_accessor :status, :sender, :receiver, :amount

 def initialize(status = "pending", sender, receiver, amount)
   @status = status
   @sender = sender
   @receiver = receiver
   @amount = amount
 end


def valid?
  self.sender.valid? && self.receiver.valid?
end

def execute_transaction
  if self.valid? && self.sender.balance > self.amount && self.status == "pending"
    sender.balance -= self.amount
    receiver.balance += self.amount
    self.status = "complete"
    status
  else self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = "reversed"
    else "unable to comply."
    end
  end



end
