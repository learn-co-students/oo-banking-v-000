class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender = BankAccount.new(self.sender)
    receiver = BankAccount.new(self.receiver)
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.status != "complete" && self.sender.balance > self.amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      receiver1 = self.receiver
      sender1 = self.sender
      self.sender = receiver1
      self.receiver = sender1
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "reversed"
    end

  end

end