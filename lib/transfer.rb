class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
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
      return false
    end
  end
  
  def execute_transaction
    if valid? && status == "pending"
      if amount < sender.balance 
        sender.balance = sender.balance - amount
        receiver.balance = receiver.balance + amount
        @status = "complete"
      else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      end
    else 
      @status = "rejected"
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      @status = "reversed"
    end
  end
  
  
    
end
