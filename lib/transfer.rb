class Transfer
  attr_accessor :amount, :status, :sender, :receiver

  def initialize(sender,receiver,amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if valid? && self.status == "complete" && receiver.balance > amount
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      self.status = "rejectd"
      "Transaction rejected. Please check your account balance."
    end

  end
end
