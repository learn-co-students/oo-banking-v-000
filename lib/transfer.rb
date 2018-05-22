class Transfer
  
  attr_accessor :amount, :sender, :receiver, :status
  
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end 
   def valid?
    sender.valid? && receiver.valid? ? true : false
end

def execute_transaction
    if self.valid? && self.status != "complete" && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    else
      self.reject_transfer
    end
end

def reject_transfer
    self.status = "rejected"
    return "Transaction rejected. Please check your account balance."
end

def reverse_transfer
    if self.valid? && self.status == "complete" && @sender.balance > @amount
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
  end
end
 
end
