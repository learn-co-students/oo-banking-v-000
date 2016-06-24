class Transfer
  attr_accessor :status, :amount, :sender, :receiver

def initialize(sender, receiver, amount, status="pending")
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = status
end

def valid_both? 
  if sender.valid? == true && receiver.valid? == true
    true
  else 
    false
  end
end

def execute_transaction
  if valid_both? && @status == "pending" && (@sender.balance > @amount)
    @sender.balance = @sender.balance - @amount
    @receiver.balance = @receiver.balance + @amount
    @status = "complete"
  else
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete"
    @sender.balance = @sender.balance + @amount
    @receiver.balance = @receiver.balance - @amount
    @status = "reversed"
      else
    @status = "rejected"
  end
end
end
