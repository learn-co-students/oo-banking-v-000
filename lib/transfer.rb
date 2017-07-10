class Transfer
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender,receiver,amount)
    @status = 'pending'
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid? && @sender.balance > @amount
      true
    else
      @status = "rejected"
      false
    end
  end

  def execute_transaction
    if @status == "pending" && self.valid?
      @receiver.balance = @receiver.balance + @amount
      @sender.balance = @sender.balance - @amount
      @status = "complete"
    else
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance = @receiver.balance - @amount
      @sender.balance = @sender.balance + @amount
      @status = "reversed"
    else
    end
  end

end
