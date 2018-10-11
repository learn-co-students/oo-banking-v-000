class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status 
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 
  
def valid?
  if sender.valid? && receiver.valid?
    true 
  else 
    false 
  end
end

def execute_transaction
  if valid? == true && self.status == "pending"
    sender.balance = sender.balance - @amount
    receiver.balance = receiver.balance + @amount
  end
    self.status = "complete"
  if valid? == false
    self.status = "rejected"
  end
   "Transaction rejected. Please check your account balance."
end

def reverse_transaction
end

def reverse_transfer
  if self.status == "complete"
    sender.balance = sender.balance + @amount
    receiver.balance = receiver.balance - @amount
  end 
  self.status = "reversed"
end

end
