class Transfer

attr_accessor :sender, :receiver, :pending, :amount, :status


def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
end

def valid?
  @sender.valid? && @receiver.valid? ? true : false
end

def execute_transaction
  @sender.balance -= @amount
  @receiver.balance += @amount
  if sender
  @status = "complete"
end



end
