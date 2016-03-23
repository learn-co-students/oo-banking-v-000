class Transfer
  attr_accessor :sender, :receiver, :transfer, :status, :amount

 def initialize(sender,receiver,transfer)
   @transfer = transfer
   @sender = sender
   @receiver = receiver
   @status = "pending"
   @amount =   50
 end
 
 

 def both_valid?
  if sender.valid? == true && receiver.valid?
    true
  else
    false
  end
end
 
 def execute_transaction
   if both_valid?
    1.times do
      self.balance -= @amount
    end
  end
end
end