class Transfer 
  attr_accessor :sender, :receiver, :amount, :status 
  
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = status
  end 
  
  def valid? 
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount && @status != "complete"
  end 
  
  def execute_transaction 
    @transfer_amount = @amount
    if self.valid? 
      @sender.balance -= @amount 
      @receiver.balance += @amount
      @amount = 0
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer 
    if status == "complete"  
      @sender.balance += @transfer_amount 
      @receiver.balance -= @transfer_amount
      @status = "reversed"
    end
  end 
end