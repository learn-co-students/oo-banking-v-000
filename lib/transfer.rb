class Transfer
  # your code here
attr_accessor :status, :sender, :receiver, :amount

def initialize (sender, receiver, amount)
@status = "pending"
@sender = sender
@receiver = receiver
@amount = amount
end

def valid?
  if @sender.valid? && @receiver.valid?
    return true
  else
    return false
  end
end

def execute_transaction
  if @status == "pending" && self.valid? && @sender.balance > @amount
    @sender.deposit(-1*@amount)
    @receiver.deposit(@amount)
    @status = "complete"
  else
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete"
    @receiver.deposit(-1*@amount)
    @sender.deposit(@amount)
    @status = "reversed"
  end

end

end
