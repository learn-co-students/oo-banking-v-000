class Transfer
  attr_accessor :transfer, :sender, :receiver, :status, :amount

  
  def initialize(sender, receiver, transfer)
    @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
end

def valid?
  self.receiver.valid? && self.sender.valid?
end

end