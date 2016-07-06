class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    receiver.valid? && sender.valid?
  end

  def execute_transaction
    if self.status != "complete"
      if  ((sender.balance - self.amount) > 0) && ((receiver.balance + self.amount) > 0)
        receiver.balance += self.amount
        sender.balance -= self.amount
        self.status = "complete"
      else
        self.bad_transfer
      end
    else
      bad_transfer
    end
  end

  def bad_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      if  ((sender.balance + self.amount) > 0) && ((receiver.balance - self.amount) > 0)
        receiver.balance -= self.amount
        sender.balance += self.amount
        self.status = "reversed"
      else
        bad_transfer
      end
    end
  end
end
