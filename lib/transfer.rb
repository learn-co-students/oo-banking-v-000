class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  def initialize(sender,receiver,amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end
  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end
  def execute_transaction
    if self.valid? && @sender.balance > @amount && @status != "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status ="complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

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
