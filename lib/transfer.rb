class Transfer
  attr_accessor :status, :amount, :sender, :receiver

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if self.both_valid? && self.status != "complete" && sender.balance >= @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        self.status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
    else
      false
    end
  end

end