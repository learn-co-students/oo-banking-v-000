class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
      @status = "pending"
      @sender = sender
      @receiver = receiver
      @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && @status != "complete"
      @status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
      if valid? && receiver.balance > amount && @status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    else
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
  end

end
