class Transfer
  attr_reader :sender, :receiver 
  attr_accessor :status, :amount 
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount 
    @status = "pending"
  end 
  
  def valid?
    if @sender.valid? && @receiver.valid?
      return true 
    else 
      return false 
    end 
  end 
  
  def execute_transaction 
    if self.valid? == true && @sender.balance >= @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount 
      @status = "complete"
    elsif @status = "complete"
        return "Transaction rejected. Please check your account balance."
    elsif @sender.valid? == false  
      @status = "rejected"
    end 
  end 
  
  def reverse_transfer 
    if @status = "complete"
      @sender.balance += @amount 
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end 
end
  