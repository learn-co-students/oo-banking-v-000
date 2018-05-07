class Transfer
  # your code here
  
  attr_accessor :status, :sender, :receiver, :amount
  
  
  def initialize(sender, receiver, transfer_amount, status = "pending" ) 
    @sender = sender
    @receiver = receiver
    @status = status
    @amount =  transfer_amount
  end 
  
  def valid? 
    if(!@sender.valid? || amount == 0)
        return false 
      elsif(!@receiver.valid? || amount == 0)
        return false 
      else 
        return true 
      end 
  end 
  
  def execute_transaction 
    if(@sender.valid? && @status != "complete" && @sender.balance > @amount)
      
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        @status = "complete"
    else 
      
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    
    end
  end 
  
  def reverse_transfer 
    if(@status != "reversed" && @status != "pending" && @status != "rejected")
        @sender.balance = @sender.balance + @amount
        @receiver.balance = @receiver.balance - @amount
        @status = "reversed"
    end 
      
  end 
  
end
