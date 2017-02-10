class Transfer
  # your code here
attr_accessor :status, :sender, :receiver, :amount

def initialize(sender, receiver, amount)
  @status = "pending"
  @sender = sender
  @receiver = receiver
  @amount = amount
end

def valid?
  @sender.valid? && @receiver.valid?
end

def execute_transaction
  if valid? && @status!="complete" && @sender.balance >= @amount
    @sender.balance -= @amount
    @receiver.balance += @amount
    self.status = "complete"
  else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete"
  @sender.balance += @amount
  @receiver.balance -= @amount
  @status = "reversed"
end
end

end
