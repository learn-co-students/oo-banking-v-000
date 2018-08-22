class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @initial_amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.valid? && @sender.balance - @amount >= 0
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      @amount = 0
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @initial_amount
      @receiver.balance -= @initial_amount
      @status = "reversed"
    end
  end

end
