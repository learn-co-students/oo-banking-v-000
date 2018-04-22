class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender != nil && receiver != nil && sender.valid? && receiver.valid?
  end

  def enough_money?
    sender.balance >= @amount && receiver.balance >= @amount
  end

  def execute_transaction
    if self.valid? && self.enough_money? && @status != "complete"
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
