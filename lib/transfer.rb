class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount 
    @status = "pending"
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      true 
    else 
      false 
    end
  end
  
  def execute_transaction
    @current_amount = @amount 
    if @sender.balance >= @amount 
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      @amount = 0
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer 
    if @status == "complete"
      @sender.balance += @current_amount 
      @receiver.balance -= @current_amount 
      @status = "reversed"
    end 
  end 
  
end
