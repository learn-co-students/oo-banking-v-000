class Transfer
  # your code here
  attr_reader
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && self.amount < self.sender.balance
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      self.sender.deposit(-self.amount)
      self.receiver.deposit(self.amount)
      self.status = "complete"
      self
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.deposit(-self.amount)
      self.status = "reversed"
    end
  end
end
