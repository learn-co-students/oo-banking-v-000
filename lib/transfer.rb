class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end

  def execute_transaction
    if "complete" == @status
      "This transfer has already gone through."
    elsif !valid?()
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if "complete" == @status
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end
  end
end
