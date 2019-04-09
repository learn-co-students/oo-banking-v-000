class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount 
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @status = "pending"
    @amount = amount 
  end
  
  def valid?
    if @sender.valid? && @receiver.valid? && @amount > 0 
      return true 
    else 
      return false 
    end
  end
  
  def execute_transaction
    if self.valid? && @sender.balance > amount && @status == "pending"
      @sender.balance -= @amount 
      @receiver.balance += @amount 
      self.status = "complete" 
    else @sender.balance < amount 
      self.status = "rejected"  ## why does it not work if I switch these two lines?
      "Transaction rejected. Please check your account balance."  ## why does it not work if I switch these two lines?
    end 
  end
  
  def reverse_transfer
    if self.valid? && @receiver.balance > amount && @status == "complete"
      @receiver.balance -= @amount 
      @sender.balance += @amount 
      self.status = "reversed" 
    else @sender.balance < amount 
      self.status = "rejected"  ## why does it not work if I switch these two lines?
      "Transaction rejected. Please check your account balance."  ## why does it not work if I switch these two lines?
    end 
  end
  
  
end
