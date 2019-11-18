class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status 
  attr_reader 

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount 
  end 
  
  def valid?
   @sender.valid? && @receiver.valid? && self.status == "pending"
  end 
    
  def execute_transaction
    if self.valid? && @sender.balance > @amount 
      @sender.balance -= @amount
      @receiver.balance += @amount 
      @status = "complete"
    else 
       @status = "rejected"
      "Transaction rejected. Please check your account balance."
     
    end 
  end 
  
  def reverse_transfer
    if @status == "complete"
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
    end 
  end 
end
