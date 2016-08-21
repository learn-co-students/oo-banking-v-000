class Transfer
  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?  && @amount < @sender.balance
  end

  def execute_transaction
    if self.valid?
    if @status == "pending"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  end
else
  @status = "rejected"
  "Transaction rejected. Please check your account balance."
end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
  
end
