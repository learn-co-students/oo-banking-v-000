class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 
  
  def valid?
    (sender.valid? && @amount <= sender.balance) && receiver.valid?
  end 
  
  def execute_transaction
    if valid? && @status != "complete" 
      sender.take_out(amount)
      receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
     sender.deposit(amount)
      receiver.take_out(amount)
      @status = "reversed"
    end
  end 
      
end
