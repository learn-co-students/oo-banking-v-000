require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  attr_reader

  def initialize(sender, receiver, int)
    @sender = sender
    @receiver = receiver
    @amount = int
    @status = "pending"
  end

  def both_valid?
    (sender.valid? && receiver.valid?) && sender.balance - amount > 0
  end

  def execute_transaction
    if both_valid? && @status != "complete"
      sender.withdraw(@amount)
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
      sender.deposit(@amount)
      receiver.withdraw(@amount)
      @status = "reversed"
    else "nothing to reverse"
    end
  end
end


