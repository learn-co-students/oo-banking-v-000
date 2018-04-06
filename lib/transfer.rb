class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  # your code here
def initialize(sender, reciever, amount)
  @sender = sender
  @receiver = reciever
  @amount = amount
  @status = "pending"
end

def valid?
  @sender.valid? && @receiver.valid?
end

def execute_transaction
  @initial_amount = @amount
  rejection = "Transaction rejected. Please check your account balance."
  if @sender.balance > @amount
    @sender.balance= @sender.balance - @amount
    @receiver.balance= @receiver.balance + @amount
    @amount = 0
    @status = "complete"
  else
    @status = "rejected"
    rejection
  end
end

def reverse_transfer
  if @status == "complete"
  @sender.balance = @sender.balance + @initial_amount
  @receiver.balance = @receiver.balance - @initial_amount
  @status = "reversed"
end
end


end
