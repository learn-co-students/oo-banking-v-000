class Transfer

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def sender=(sender)
    @sender = sender
  end

  def sender
    @sender
  end

  def receiver=(receiver)
    @receiver = receiver
  end

  def receiver
    @receiver
  end

  def amount=(amount)
    @amount = amount
  end

  def amount
    @amount
  end

  def status=(status)
    @status = status
  end

  def status
    @status
  end

  def valid?
    if sender.valid? == true and receiver.valid? == true and (sender.balance - @amount > 0)
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? == true and @status == "pending"
      receiver.balance += @amount
      sender.balance -= @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? == true and @status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

end
