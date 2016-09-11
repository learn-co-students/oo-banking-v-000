class Transfer

  attr_accessor :transfer, :sender, :receiver, :amount, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && @status == "pending" && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
  end
      "Transaction rejected. Please check your account balance."

  end

  def reverse_transfer
    if @status != "complete"

    else
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"

    end
  end

end
