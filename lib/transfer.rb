class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def both_valid?
    @valid = false
    
    if @sender.valid? && @receiver.valid?
        @valid = true
    end
    
    @valid
  end
  
  def execute_transaction
    if both_valid? && sender.balance >= amount && status == "pending"
       @sender.balance -= @amount
       @receiver.balance += @amount
       @status = "complete"
    else
       @status = "rejected"
       reject_transfer
    end
  end
  
  def reverse_transfer
    if @status == "complete"
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"
    end
  end
  
  def reject_transfer
    "Transaction rejected. Please check your account balance."
  end
end