class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def valid?
    if sender.valid? && receiver.valid? && sender.balance > self.amount
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
