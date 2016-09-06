class Transfer
    attr_accessor:sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
  end
  
  def valid?
      self.sender.valid? && self.receiver.valid? ? true : false
  end
  
  def execute_transaction
      if !sender.valid? || sender.balance < amount
          self.status = "rejected"
          return "Transaction rejected. Please check your account balance."
      elsif self.valid? && self.status == "pending"
          sender.balance -= amount
          receiver.balance += amount
          self.status = "complete"
      end
  end
  
  def reverse_transfer
      if self.status == "complete"
          sender.balance += amount
          receiver.balance -= amount
          self.status = "reversed"
      end
  end
end
