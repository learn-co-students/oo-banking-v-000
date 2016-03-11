class Transfer
  # code here
  attr_accessor :sender, :receiver, :status, :amount, :complete_counter
  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.status = "pending"
    self.amount = amount
    self.complete_counter = 0
  end
  def both_valid?
    sender.valid? && receiver.valid?
  end
  def execute_transaction
    if self.status == "pending" && self.both_valid? && self.sufficient_funds
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.reject_transfer
    end
  end
  def sufficient_funds
    self.sender.balance - self.amount > 0
  end
  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end