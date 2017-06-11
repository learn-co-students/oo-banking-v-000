class Transfer

  attr_reader :amount, :sender, :status, :receiver

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
#    sender.status == "open" && sender.balance > 0 && receiver.status == "open" && receiver.balance > 0
  end

  def execute_transaction
    if self.valid? && amount <= sender.balance && @status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end

end
