class Transfer
attr_accessor :status
attr_reader :sender, :receiver, :amount

def initialize(sender, receiver, amount)
  @amount = amount
  @sender = sender
  @receiver = receiver
  @status = "pending"

end

def valid?
  sender.valid? && receiver.valid?
end

def reject_transfer
  self.status = "rejected"
  "Transaction rejected. Please check your account balance."
end

def execute_transaction
  if valid? && sender.balance > amount && self.status == "pending"
    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"
  else
    reject_transfer
  end
end

def reverse_transfer
  if valid? && sender.balance > amount && self.status == "complete"
    sender.balance += amount
    receiver.balance -= amount
    self.status = "reversed"
  else
    reject_transfer
  end
end 

end
