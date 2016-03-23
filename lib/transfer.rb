class Transfer
  attr_accessor :sender, :receiver, :transfer, :status, :amount

 def initialize(sender,receiver,amount)
   
   @sender = sender
   @receiver = receiver
   @status = "pending"
   @amount =   amount
 end
 
 

 def both_valid?
  if sender.valid?  && receiver.valid?
    true
  else
    false
  end
end
 
 
   def execute_transaction
   if self.both_valid? && status == "pending" && sender.balance > amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    else 
      reject_transfer
    end
  end


  
 
 def reject_transfer
  
     self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if execute_transaction
      @sender.balance += amount
      @receiver.balance -= amount
      self.status = "reversed"
    
    end
 end

end