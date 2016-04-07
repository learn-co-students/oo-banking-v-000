class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    @sender.balance >= @amount && @sender.valid? && receiver.valid?
  end

  def execute_transaction
     if both_valid? && status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
       else
       reject_transfer
     end
  end

  def reject_transfer

     @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.execute_transaction
    @receiver.balance -= @amount
    @sender.balance += @amount
    @status = "reversed"
    end
  end
end