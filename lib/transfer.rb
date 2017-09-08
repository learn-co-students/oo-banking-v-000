class Transfer
  # your code here
attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    end
  end

  def execute_transaction
    if !valid? || sender.balance < @amount
      @status = "rejected"
     "Transaction rejected. Please check your account balance."
   elsif @status == "complete"
     "Already completed."
   else
     @sender.deposit(-@amount)
     @receiver.deposit(@amount)
     @status = "complete"
   end
  end

  def reverse_transfer
    if execute_transaction
      @sender.deposit(amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end
  end
end
