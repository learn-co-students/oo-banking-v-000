class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(from, to, amount)
    @sender = from
    @receiver = to
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status == "pending" && self.valid? && self.sender.balance >= self.amount
      self.sender.balance -= self.amount
      self.receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete" && self.valid? && self.receiver.balance >= self.amount
      self.receiver.balance -= self.amount
      self.sender.deposit(self.amount)
      self.status = "reversed"
    end
  end
end
