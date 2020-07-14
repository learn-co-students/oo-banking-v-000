class Transfer


attr_accessor :sender, :receiver, :status, :amount

def initialize(sender, receiver, transfer)
  @sender = sender
  @receiver = receiver
  @amount = transfer
  @status = "pending"
  @broke = 0
  @closed = "closed"
end

def valid?
  @sender.valid? && @receiver.valid?
end

def execute_transaction
  @sender.deposit(-@transfer)
  @receiver.deposit(@transfer)
  @status = "complete"

end

end
