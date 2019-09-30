class Transfer


attr_accessor :sender, :receiver, :status, :amount

def initialize(sender, receiver, transfer)
  @sender = sender
  @receiver = receiver
  @transfer = transfer
  @status = "pending"
  @amount = 50
end

def valid?(transfer)
   @status == "pending" && @amount > 0

end
end
