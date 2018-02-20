class Transfer

  attr_accessor :sender, :receiver, :amount, :status, :balance

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status != "pending" || !self.valid? || sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status = "complete" && self.valid? && receiver.balance > sender.balance
    receiver.balance -= @amount
    sender.balance += self.amount
    @status = "reversed"
    end
  end

end
