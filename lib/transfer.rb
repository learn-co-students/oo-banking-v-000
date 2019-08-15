class Transfer

attr_accessor :sender, :receiver, :amount, :status


def initialize(sender, receiver, amount)
 @amount = amount
 @sender = sender
 @receiver = receiver
 @status = "pending"
end

def valid?
  @sender.valid? && @receiver.valid?
end

def execute_transaction
  if valid? && @sender.balance > @amount && @status == "pending"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  else
    reject_transfer
  end
end

def reject_transfer
  @status = "rejected"
  "Transaction rejected. Please check your account balance."
end

def reverse_transfer
  if @status == "complete"
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
  end
end

end
