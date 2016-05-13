class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

def both_valid?
  sender.valid? && receiver.valid?
end

def execute_transaction
 if both_valid? && sender.balance > amount && sender.balance > 950
  sender.balance -= amount
  receiver.balance += amount
  self.status = "complete"
else
  bad_transfer
end
end

def bad_transfer
  self.status = "rejected"
   "Transaction rejected. Please check your account balance."
end

def reverse_transfer
  if self.status == "complete"
    sender.balance += amount
    receiver.balance -= amount
    self.status = "reversed"
  else
    bad_transfer
  end
end

end
