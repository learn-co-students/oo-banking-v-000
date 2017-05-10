class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.balance >= @amount && @sender.valid? && @receiver.valid?
      true
    else
      false
    end 
  end

  def execute_transaction
    if valid? && self.status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if execute_transaction
      @receiver.balance -= @amount
      @sender.balance += @amount
      self.status = "reversed"
    else
      @sender.balance
    end
  end

end
