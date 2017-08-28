class Transfer

    attr_accessor :sender, :receiver, :amount, :status, :transfer

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @transfer
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
    false
    end
  end

  def execute_transaction
      if self.status == "pending"
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    else
      @status
    end

    if !sender.valid?
      @status = "rejected"
     "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer

    if self.status == "complete"
    sender.balance = sender.balance + amount
    receiver.balance = receiver.balance - amount
    self.status = "reversed"
  else
    @status
  end
  end

end
