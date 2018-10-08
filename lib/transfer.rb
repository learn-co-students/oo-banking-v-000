class Transfer
  
  attr_accessor :transfer, :sender, :receiver, :amount, :status, :balance
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
     @sender.valid?
     @receiver.valid?
  end
  
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending" 
          sender.balance -= amount 
          receiver.balance += amount
          self.status = "complete"
    else 
          self.status = "rejected"
          "Transaction rejected. Please check your account balance."
           
    end
     
  end
end
   # but for inside, instead of manually setting them, do you think we can subtract and add the amount to the balances?
  

    
      
        
      
      
      
     
   
 
    
     
      
    
    
  
  

