class Transfer
  attr_accessor :status, :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?

    if sender.valid? && receiver.valid? && sender.balance >= amount
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.valid?
      if self.status != "complete"
        self.sender.balance -= amount
        self.receiver.balance += amount

        self.status = "complete"
      else
        "Transaction already processed."
      end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end


end
