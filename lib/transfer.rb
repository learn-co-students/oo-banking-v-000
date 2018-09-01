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
  if sender.valid? && receiver.valid? && @amount <= sender.balance && self.status == "pending" 
     receiver.balance += @amount 
     sender.balance -= @amount 
     self.status = "complete"
  else 
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
 end

def reverse_transfer
  if valid? && receiver.balance > amount && self.status == "complete" 
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
  else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
end