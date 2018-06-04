class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :last_transaction
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 
  
  def valid?
    if @sender.valid? && @receiver.valid? 
      valid = true 
    else 
      valid = false 
    end 
    valid
  end 
  
  def execute_transaction
    if valid? == true && @status == "pending"
      if (@sender.balance - amount) > 0 
        @last_transaction = @amount
        @sender.balance = @sender.balance - amount 
        @receiver.balance = @receiver.balance + amount
        @status = "complete"
      else 
        @status = "rejected"
        statement = "Transaction rejected. Please check your account balance."
      end 
    end 
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance = @sender.balance + @last_transaction
      @receiver.balance = @receiver.balance - @last_transaction
      @status = "reversed"
    end 
  end 
end
