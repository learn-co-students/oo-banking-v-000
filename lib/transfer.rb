class Transfer

  attr_accessor :amount, :status, :sender, :receiver

  def initialize(sender, receiver, amount= 50, status="pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && @sender.balance >= @amount
      until @status == "complete"
        @receiver.deposit(@amount)
        @sender.balance -= @amount
        @status = "complete"
      end
    else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
