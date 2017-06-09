class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    (@sender.valid? && @receiver.valid?)? true : false
  end

  def execute_transaction
    if @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      if valid?
        @status = "complete"
      else
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
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
