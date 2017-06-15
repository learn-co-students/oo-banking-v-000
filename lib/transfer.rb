class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def successful_transfer
    self.sender.withdraw(self.amount)
    self.receiver.deposit(self.amount)
    self.status = "complete"
  end

  def failed_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    if self.valid? && self.status == "pending" && self.sender.balance >= self.amount
      self.successful_transfer
    else
      self.failed_transfer
    end
  end

  def reverse_transfer
    if self.status == "complete" && self.valid? && self.receiver.balance >= self.amount

      self.receiver.withdraw(self.amount)
      self.sender.deposit(self.amount)
      self.status = "reversed"
    end
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

end
