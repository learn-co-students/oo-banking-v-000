class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if ((@sender.valid? == true) && (@receiver.valid? == true))
      true
    else
      false
    end
  end

  def execute_transaction
    rejection = "Transaction rejected. Please check your account balance."

    if @amount > @sender.balance
      @status = "rejected"
      rejection
    elsif @status == "pending"
      @receiver.deposit(@amount)
      @sender.withdraw(@amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.withdraw(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
end
