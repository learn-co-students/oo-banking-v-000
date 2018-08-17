class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if (self.sender.valid? && self.sender.balance >= self.amount) && self.receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      self.sender.balance = self.sender.balance - self.amount
      self.receiver.balance = self.receiver.balance + self.amount
      self.status = "complete"
    elsif !self.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance = self.sender.balance + self.amount
      self.receiver.balance = self.receiver.balance - self.amount
      self.status = "reversed"
    end
  end

end
