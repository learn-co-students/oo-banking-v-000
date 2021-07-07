class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    self.amount > 0 && sender.valid? && receiver.valid?
  end
  
  def execute_transaction
     if self.valid? && self.status == "pending" && sender.balance > amount
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else
      bad_transfer
   end
  end
  
  def reverse_transfer
    if self.status == "complete"
     sender.balance += self.amount
     receiver.balance -= self.amount
     self.status = "reversed"
   end
 end
 
 def bad_transfer
   self.status = "rejected"
   "Transaction rejected. Please check your account balance."
 end
      
    
  
end
