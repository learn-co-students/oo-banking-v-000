class Transfer
  # your code here
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end

  def valid?
    sender.valid? &&  receiver.valid? && sender.balance >= self.amount
    # do I need to check that sender's balance is ok? -- sender.balance >= sender.ba...
  end

  def execute_transaction
    if self.valid? && self.status != "complete"
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    elsif !self.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.status = "reversed"
      sender.balance += self.amount
      receiver.balance -= self.amount
    end
  end

end
