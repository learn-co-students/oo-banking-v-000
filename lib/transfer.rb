class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
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
    if self.valid? && @status == "pending" && sender.balance > @amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && @status == "complete" && receiver.balance > @amount
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
end
