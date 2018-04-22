class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status)
    @sender = sender
    @receiver = receiver
    @amount = 50
    @status = "pending"
  end
  
  def valid?
    if @sender && @receiver
      true
    end
    
  end
  
  def execute_transaction
    #@sender - @amount
    #@receiver + @amount
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  
  def reverse_transfer
    
  end
  
end
