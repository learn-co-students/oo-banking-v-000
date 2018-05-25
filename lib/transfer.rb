
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    self.status = "pending"
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
  end
  
  def valid?
    
  end
  
end
