class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end
  
  def valid?
    if self.sender.valid? == true && self.receiver.valid? == true
      true 
    else 
      false 
    end
  end
  
  def execute_transaction
    if self.sender.balance < self.amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "pending"
      self.sender.balance = self.sender.balance - amount 
      self.receiver.balance = self.receiver.balance + amount
      self.status = "complete"
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      self.sender.balance = self.sender.balance + amount
      self.receiver.balance = self.receiver.balance - amount
      self.status = "reversed"
    end
  end

end