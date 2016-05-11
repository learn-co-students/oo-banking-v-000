class Transfer
 
  attr_accessor :status, :sender, :receiver, :amount


  def initialize(sender, receiver, amount) 
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    @sender.valid? && @receiver.valid? 
  end

  def execute_transaction
    if @status == "pending" && both_valid? && @sender.balance > @amount
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    else
      reject_transaction
    end
  end

  def reject_transaction
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    else
      @status = "reversed"
    end
  end

end