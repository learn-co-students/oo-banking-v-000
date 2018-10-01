class Transfer
  
  attr_accessor :status, :amount, :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @status = 'pending'
    @amount = amount
    @receiver = receiver
    @sender = sender
  end
  
  def valid?
   if @sender.valid? && @receiver.valid?; TRUE
    else
      FALSE
    end
  end
  
  def execute_transaction
    if @status == "complete"; NIL
    elsif @sender.balance < @amount
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
    else
      @status = "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
      @sender.balance += @amount
      @receiver.balance -= @amount
    end
  end
end