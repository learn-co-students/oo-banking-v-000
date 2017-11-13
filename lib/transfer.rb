class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      if self.sender.balance >= amount
        self.sender.withdraw(amount)
        self.receiver.deposit(amount)
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    else
      self.status = "rejected"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.withdraw(amount)
      self.sender.deposit(amount)
      self.status = "reversed"
    end
  end
end
