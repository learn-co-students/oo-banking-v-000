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
    self.valid?
  end
  
  def execute_transaction
    
  end
  
  def reverse_transfer
    
  end
  
end
