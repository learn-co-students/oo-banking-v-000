class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender 
    @receiver = receiver
    @status = status
    @amount = amount
  end
  
  def valid?
    if @sender.valid? && @sender.balance > @amount && @receiver.valid?
      true 
    else
      false
    end
  end
  
  def execute_transaction
    if valid? && status == "pending"
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if valid? && status == "complete"
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    else
      "There is no transaction to reverse."
    end
  end
end
