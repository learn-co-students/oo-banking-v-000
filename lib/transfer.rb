class Transfer
  attr_accessor :transfer, :status, :amount
  attr_reader :sender, :receiver

  def initialize(status = "pending", sender, receiver, amount)
    @transfer = transfer
    @status = status
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if @status != "complete"
      if @amount > @sender.balance
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
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
