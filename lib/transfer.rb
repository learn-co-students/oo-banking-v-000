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
    sender.valid? && receiver.valid? && self.status == "pending" && sender.balance >= @amount
  end

  def reverse_execute
    @sender.balance += amount
    @receiver.balance -= amount
    self.status = "reversed"
  end

  def execute
    @sender.balance -= amount
    @receiver.balance += amount
    self.status = "complete"
  end

  def execute_transaction
    if self.valid?
      self.execute
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    self.reverse_execute unless self.status == "pending"
  end
end
