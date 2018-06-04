class Transfer
  attr_accessor :sender, :receiver, :amount, :status 
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount 
    @status = "pending"
  end 
  
  def valid?
    if (@sender.valid? == true && @receiver.valid? == true)
      true 
    else 
      false 
    end 
  end 
  
  def execute_transaction
    if (self.status == "complete")
      self 
    elsif (self.sender.balance - self.amount < 0)
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif (self.sender.valid?)
      self.sender.balance = self.sender.balance - amount
      self.receiver.balance = self.receiver.balance + amount 
      self.status = "complete"
    end 
  end 
  
  def reverse_transfer 
    if (self.status == "complete")
    self.sender.balance = self.sender.balance + amount
    self.receiver.balance = self.receiver.balance - amount
    self.status = "reversed"
    end 
  end 
  
end