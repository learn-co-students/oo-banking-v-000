class Transfer
attr_accessor :sender, :receiver, :status, :amount
attr_reader

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
      if self.valid? && self.status == "pending" && sender.balance > @amount
      self.status = "complete"
      receiver.balance += amount
      sender.balance = sender.balance - amount
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
      if self.status == "complete"
        receiver.balance = receiver.balance - amount
        sender.balance = sender.balance + amount
        self.status = "reversed"
      end
  end
end
