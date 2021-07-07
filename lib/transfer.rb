class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, money)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = money
  end

  def valid?
    return @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
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
