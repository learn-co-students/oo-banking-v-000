class Transfer
  
  attr_accessor :status 
  attr_reader :sender, :receiver, :amount 


  def initialize(receiver)
    @sender = sender
    @receiver = receiver 
    @status = "pending"
    @transfer_amount = transfer_amount 
    
  end 
  
  
  
  
  def valid? 
    
  end 
  
  
  
  
  def execute_transaction
    
  end 
  
 
 
  
  def reverse_transfer 
    
  end 
  

end 