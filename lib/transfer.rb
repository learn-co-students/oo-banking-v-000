class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end


  def both_valid?
    #sender.valid? && receiver.valid?
    return @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if (@status != "pending")
      return
    end
    if !(self.both_valid? && @sender.balance>@amount)
      self.reject_transfer
      return "Transaction rejected. Please check your account balance."
    end
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  end

  def reject_transfer
    @status = "rejected"
  end

  def reverse_transfer
    if (@status == "complete")
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status="reversed"
    end
  end
end
