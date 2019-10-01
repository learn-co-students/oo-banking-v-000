class Transfer


attr_accessor :sender, :receiver, :status, :amount

def initialize(sender, receiver, transfer)
  @sender = sender
  @receiver = receiver
  @transfer = transfer
  @status = "pending"
  @amount = 50
  @broke = 0
  @closed = "closed"
end

def valid?
  @sender.valid? && @receiver.valid?
end
#get zooom session and explain how valid? is checked
def execute_transaction
end

end
