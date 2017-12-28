class Transfer
#=========================================================
  # INSTANCE ATTRIBUTES
#=========================================================
attr_accessor :sender, :receiver, :amount, :status
#=========================================================  
  # INSTANCE
#=========================================================
  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
    self.status = "pending"
  end
  
  def valid?
    self.sender.valid? && self.receiver.valid?? true:false
  end

  def execute_transaction
    self.uniq_and_valid_amount ? self.accept : self.reject
  end
  
  def reverse_transfer
    if self.status == "complete" then self.reverse end
  end
  
#=======================HELPERS============================  
  def uniq_and_valid_amount
    self.status == "pending" and self.sender.balance >= self.amount
  end
  
  def accept
    self.sender.balance -= self.amount
    self.receiver.balance += self.amount
    self.status = "complete"
  end
  
  def reject
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  
  def reverse
    self.sender.balance += self.amount
    self.receiver.balance -= self.amount
    self.status = "reversed"
  end
#========================================================== 
end
