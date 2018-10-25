class Transfer
  attr_accessor :sender, :receiver, :amount, :status

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
    if self.valid? && self.sender.balance > self.amount && self.status == "pending"
      self.status = "complete"
      self.receiver.deposit(self.amount)
      self.sender.deposit(self.amount * -1)
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.status = "reversed"
      self.sender.deposit(self.amount)
      self.receiver.deposit(self.amount * -1)
    end
  end
end
