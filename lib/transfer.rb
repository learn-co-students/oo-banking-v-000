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
    
  end
  
end
