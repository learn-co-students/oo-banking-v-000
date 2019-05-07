class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      return true 
    else 
      false 
    end
  end
  
  def execute_transaction
    if valid? && @status == "pending" && @sender.balance > @amount
      receiver.balance += @amount
      sender.balance -= @amount 
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if execute_transaction
    receiver.balance -= @amount
    sender.balance += @amount
    @status = "reversed"
  end
  end
    
end
