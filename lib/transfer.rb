class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    @sender.valid? && @sender.balance > @amount && @receiver.valid? && @status == "pending"
  end

  def execute_transaction
    if self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      "Transaction completed."
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
      "Transaction reversed."
    else
      "error"
    end
  end
end
