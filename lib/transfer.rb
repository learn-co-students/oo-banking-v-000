class Transfer
  attr_accessor :sender, :receiver, :pending, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.valid? == false || sender.balance < @amount   
      reject_transfer
    elsif @status == "pending"
      receiver.deposit(@amount)
      sender.deposit(-@amount)
      @status = "complete"
    else
      nil
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      receiver.deposit(-@amount)
      sender.deposit(@amount)
      @status = "reversed"
    end
  end

end

