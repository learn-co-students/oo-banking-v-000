class Transfer
  attr_reader :amount, :receiver, :sender
  attr_accessor :status

  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @amount = transfer_amount
    @status = "pending"
  end

  def execute_transaction
    if ((self.valid?) && (self.status == "pending") && (self.sender.balance >= self.amount))
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if (self.status == "complete")
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

  def valid?
    if (self.sender.valid? && self.receiver.valid?)
      return true
    else
      return false
    end
  end
end
