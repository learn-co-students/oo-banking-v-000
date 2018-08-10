class Transfer
    attr_accessor :status, :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end
  
  def valid?
    self.sender.valid? && self.receiver.valid? && self.sender.balance > self.amount
  end
  
  def execute_transaction
    if self.valid? == true && self.status != "complete"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected" 
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status = "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
      
    end
  end
  
  
  
end
