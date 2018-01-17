class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
    self.status = "pending"
  end

  def valid?
    self.sender.valid?(self.amount) && self.receiver.valid?
  end

  def execute_transaction
    if !self.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "pending" || self.status == "reversed"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
