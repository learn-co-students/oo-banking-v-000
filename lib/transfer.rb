class Transfer
  attr_accessor :sender, :receiver, :status, :balance, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true: false
  end

  def execute_transaction

    if @sender.valid? && self.status == "pending" && @sender.balance - @amount >= 0
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @sender.balance != 1000
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
