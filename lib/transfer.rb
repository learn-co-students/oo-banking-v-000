class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end

  def execute_transaction
    if !valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    return if @status == "complete"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  end

  def reverse_transfer
    return if @status != "complete"
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
  end
end
