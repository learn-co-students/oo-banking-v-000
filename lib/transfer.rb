class Transfer

attr_accessor :sender, :receiver, :amount
attr_reader :status

def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
end

def valid?
  sender.valid? && receiver.valid?
end

def execute_transaction
  if valid? && sender.balance > amount && self.status == "pending"
    sender.balance -= amount
    receiver.balance += amount
    @status = "complete"
  else sender.balance <= 0
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete"
    sender.balance += amount
    receiver.balance -= amount
    @status = "reversed"
  end
end

end
