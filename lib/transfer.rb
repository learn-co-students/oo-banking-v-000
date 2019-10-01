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

def valid?(transfer)
    @transfer == "open" && @amount > 0
   transfer.valid?
end
end
