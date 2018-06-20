class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end
  
  def valid?
    if self.sender.valid? && self.receiver.valid? && self.sender.balance > self.amount
      true
    else
      false
    end
  end
  
  def execute_transaction
    if self.valid? && self.status == 'pending'
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = 'complete'
    else 
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == 'complete'
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = 'reversed'
    end
  end
  
end
