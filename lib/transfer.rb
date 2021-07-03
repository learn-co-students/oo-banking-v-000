class Transfer
  attr_reader :amount, :sender, :receiver 
  attr_accessor :status

def initialize(sender, receiver, amount, status="pending")
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = status
end

def valid? 
  @sender.valid? && @receiver.valid?
end

def execute_transaction
  if valid? && @status == "pending" && (@sender.balance > @amount)
    @sender.balance = @sender.balance - @amount
    @receiver.balance = @receiver.balance + @amount
    @status = "complete"
  else
    @status = "rejected"
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
