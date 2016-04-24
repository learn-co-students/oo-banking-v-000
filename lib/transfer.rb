class Transfer

  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if sender.balance < amount
      self.reject_transfer
    else
      if @status == "pending"
        sender.balance -= amount
        receiver.deposit(@amount)
        @status = "complete"
      end
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      receiver.balance -= amount
      sender.deposit(@amount)
      @status = "reversed"
    end
  end

end
