class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  attr_reader :something

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    (@sender.valid? && receiver.valid?) && sender.balance - amount > 0
  end

  def execute_transaction
    if both_valid? && @status != "complete"
      sender.withdrawal(@amount)
      receiver.deposit(@amount)
      @status = "complete"
    else reject_transfer
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      receiver.withdrawal(@amount)
      sender.deposit(@amount)
      @status = "reversed"
    else "nothing to reverse"
    end

  end
end


