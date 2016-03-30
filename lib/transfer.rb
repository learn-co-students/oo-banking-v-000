class Transfer
  # code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def sufficient_funds?
    sender.balance > self.amount
  end

  def both_valid?
    sender.valid? && receiver.valid? 
  end

  def execute_transaction
    if self.status == "pending" && both_valid? && sufficient_funds?
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
      
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
    end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = "reversed"
    end
  end

end