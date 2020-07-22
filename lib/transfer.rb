class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    if valid? && self.status == "pending" && sender.balance >= amount
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if valid? && self.status == "complete" && receiver.balance > amount
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
end
