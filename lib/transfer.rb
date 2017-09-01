class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :rev_amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.sender.balance <= amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.rev_amount = amount
      self.amount = 0
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += @rev_amount
      self.receiver.balance -= @rev_amount
      self.status = "reversed"
    end
  end

end
