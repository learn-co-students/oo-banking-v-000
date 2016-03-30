class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def both_valid?
    if (sender.valid? && receiver.valid?)
      return true
    else
      return false
    end
  end
  
  def execute_transaction
    if sender.status == "closed" || sender.balance < amount
      self.reject_transfer
      return "Transaction rejected. Please check your account balance."
    elsif self.status == "pending" 
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"      
    end
  end
  
  def reject_transfer    
      @status = "rejected"     
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"  
    end
  end
end