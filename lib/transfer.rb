class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :receipt

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

   if  self.valid?
    @sender.balance = @sender.balance - @amount
    @receiver.balance = @receiver.balance + @amount
    @receipt = @amount
    @amount = 0
    @status = "complete"
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  end

  def reverse_transfer
    if @status == "complete"
    @sender.balance = @sender.balance + @receipt
    @receiver.balance = @receiver.balance - @receipt
    @status = "reversed"
  end
  end
end
