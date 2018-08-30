class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  
def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
end

def valid?
  self.receiver.valid? && self.sender.valid?
end

def execute_transaction
 if self.valid?
   @receiver.balance += @amount 
   @sender.balance -= @amount 
   @status = "complete"
else @status = "pending"
  false
end
end
end