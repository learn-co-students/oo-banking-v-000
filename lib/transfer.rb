class Transfer
attr_accessor :sender, :receiver, :status, :amount
 def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @status = 'pending'
   @amount = amount
 end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
    @amount = 0
  end

  def reject_transfer
    if !(sender.valid?) || (@sender.balance < @amount)
      "Transaction rejected. Please check your account balance."
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
  end
  # code here
end