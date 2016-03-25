class Transfer
attr_accessor :sender, :receiver, :status, :amount
 def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @status = 'pending'
   @amount = amount
   @amount1 = @amount
 end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def reject_transfer
    if !(sender.valid?) || (@sender.balance < @amount)
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def execute_transaction
    if reject_transfer
      reject_transfer
      else
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
    @amount = 0
    end
  end


  def reverse_transfer
    if @status == "complete"
    @sender.balance += @amount1
    @receiver.balance -= @amount1
    @status = "reversed"
      @amount1 = 0
    else @amount1 = 0
    end
  end
  # code here
end