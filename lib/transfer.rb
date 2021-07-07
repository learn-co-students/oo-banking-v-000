class Transfer

attr_accessor :status, :amount, :sender, :receiver

def initialize(sender, receiver, amount)
  @status = "pending"
  @amount = amount
  @sender = sender
  @receiver = receiver
end

def valid?
  @sender.valid? && @receiver.valid?
end

def execute_transaction
  if !valid? || sender.balance < @amount
    @status = "rejected"
     "Transaction rejected. Please check your account balance."
    #status = "rejected"
  elsif @status != "complete"
sender.balance = sender.balance - @amount
receiver.balance = receiver.balance + @amount
@status = "complete"
end
  end

def reverse_transfer
  execute_transaction
  sender.balance = sender.balance + @amount
  receiver.balance = receiver.balance - @amount
  @status = "reversed"
end

end
