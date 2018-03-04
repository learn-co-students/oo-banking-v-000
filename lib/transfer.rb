class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender 
    @receiver = receiver 
    @status = status
    @amount = amount 
    @complete = false 
    
  end 
  
  def valid?
    sender.valid? && receiver.valid?
  end 
  
  def execute_transaction 
    message = ""
    if self.valid? && @status == "pending"
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
      message = @status
    end 
    if !self.valid?
      @status = "rejected"
      message = "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer 
    if @status = "complete"
      @sender.balance = @sender.old_balance
      @receiver.balance = @receiver.old_balance 
      @status = "reversed"
    end 
  end 
end
