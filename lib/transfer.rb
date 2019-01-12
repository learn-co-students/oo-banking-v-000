class Transfer
 attr_accessor :transfer, :sender, :receiver, :status
 
 def initialize(transfer, sender, receiver)
   @transfer = transfer
   @sender = sender
   @receiver = receiver
   @status = "pending"
 end
 
end
