class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.sender.balance >= amount
      if self.status != "complete"
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
      end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end
end
