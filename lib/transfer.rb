class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if !valid_after_transaction?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    if @status == "pending"
        @sender.deposit(-@amount)
        @receiver.deposit(@amount)
        @status = "complete"
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(-@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
  
  private
  
  def valid_after_transaction?
    (@sender.balance - @amount) > 0 
  end
    
end
