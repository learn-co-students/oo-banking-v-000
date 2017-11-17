class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? && !(self.status == "complete")
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      if !self.valid?
        reverse_transfer
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      self.status = "reversed"
    end
  end

end
