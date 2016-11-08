class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

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
    if !self.valid? || self.sender.balance < self.amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "complete"
      "Transaction has already been completed."
    else
      self.sender.withdraw(self.amount)
      self.receiver.deposit(self.amount)
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.withdraw(self.amount)
      self.sender.deposit(self.amount)
      self.status = "reversed"
    end
  end

end
