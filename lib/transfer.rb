class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    return true if (sender.valid?(@amount) and receiver.valid?)
  end

  def execute_transaction
    if !self.valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    if(status == "pending")
      sender.balance -= @amount
      receiver.deposit(@amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if(status == "complete")
      receiver.balance -= @amount
      sender.deposit(@amount)
      @status = "reversed"
    end
  end

end
