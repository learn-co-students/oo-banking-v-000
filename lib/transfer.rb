class Transfer
  # attr_reader :amount, :sender, :receiver
  attr_accessor :status, :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status == "pending" && both_valid? && sender.balance > amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if both_valid? && receiver.balance > amount && self.status == "complete"
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
