class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status = "pending", amount)
    @receiver = receiver
    @sender = sender
    @status = status
    @amount = amount
  end
  
  def valid?
    if @receiver.valid? == true && @sender.valid? == true
      true
    else
      false
    end
  end
  
  def execute_transaction
    
    if @status == "pending"
      
      if self.valid? == true
        
        if @sender.balance > @amount
          @sender.balance = @sender.balance - @amount
          @receiver.balance = @receiver.balance + @amount
          @status = "complete"
        else
          @status = "rejected"
          "Transaction rejected. Please check your account balance."
        end      
      else
        "Transaction rejected. Please check your account balance."
      end
    end
    
  end
  
  def reverse_transfer
    
    if @status == "complete"
      
      @sender.balance = @sender.balance + @amount
      
      @receiver.balance = @receiver.balance - @amount
      
      @status = "reversed"
    
    end
      
  end
  
  
  
  
  
end
