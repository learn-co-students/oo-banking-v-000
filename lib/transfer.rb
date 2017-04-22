class Transfer
  attr_accessor :sender,:receiver,:status,:amount

  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
    self.status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.sender.balance >= self.amount && self.status == "pending"
      self.sender.withdrawal(self.amount)
      self.receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.withdrawal(self.amount)
      self.sender.deposit(self.amount)
      self.status = "reversed"
    end
  end

end
