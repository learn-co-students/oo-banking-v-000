class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @receiver.valid? && @sender.valid? && @sender.balance >= @amount
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      reject
  end
end

def reverse_transfer
  if self.status == "complete"
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
  else
    reject
end
end
def reject
  self.status = "rejected"
  "Transaction rejected. Please check your account balance."
end
end
