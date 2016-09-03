class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
    self.status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance >= self.amount
  end

  def execute_transaction
    if !(self.valid?)
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    return "Transaction already completed." if self.status == "complete"
    sender.balance -= self.amount
    receiver.balance += self.amount
    self.status = "complete"
  end

  def reverse_transfer
    return "Cannot reverse an unexecuted transaction." if self.status != "complete"
    sender.balance += self.amount
    receiver.balance -= self.amount
    self.status = "reversed"
  end

end
