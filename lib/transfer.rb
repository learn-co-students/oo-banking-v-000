class Transfer
  
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount, status = "pending")
    self.status = status
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status == "pending" && both_valid? && sender.balance >= amount
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else
      self.reject_transfer
    end    
  end

  def reject_transfer
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."      
  end


  def reverse_transfer
    while self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end