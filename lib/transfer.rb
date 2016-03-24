class Transfer
  # code here
  attr_accessor :status, :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def both_valid?
    @sender.valid? && @receiver.valid?
  end
  def execute_transaction
    if both_valid? && @status == "pending" && @amount < @sender.balance
      sender.balance -= @amount
      receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reject_transfer
    if @sender.valid? != true || @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance"
    end
  end
  def reverse_transfer
    if @status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
