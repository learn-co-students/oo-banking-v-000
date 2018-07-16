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
    if valid? && @sender.balance > @amount && @status == "pending"
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    else
      return "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
  end
  
  def reverse_transfer
    if valid? == true && @status == "complete"
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    else
      return "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
  end
end
