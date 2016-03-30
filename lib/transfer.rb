class Transfer
  attr_accessor :sender, :receiver, :amount, :status

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
      sender.deposit(-amount)
      receiver.deposit(amount)
    if @status == "pending" && both_valid? 
      @status = "complete"
    else reject_transfer
    end
  end

  def reject_transfer
    sender.deposit(amount)
    receiver.deposit(-amount)
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      sender.deposit(amount)
      receiver.deposit(-amount)
      @status = "reversed"
    end
  end

end