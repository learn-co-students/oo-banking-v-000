class Transfer
  
  attr_accessor :transfer, :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if both_valid? && self.status == "pending"
      if sender.balance >= amount
          sender.balance -= amount
          receiver.balance += amount
          self.status = "complete"      
      else
        reject_transfer
      end
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    message = "Transaction rejected. Please check your account balance."  
    message
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end

  # def valid?
    
  # end



end