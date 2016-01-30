class Transfer
  # code here
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender,receiver,amount,status="pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount.to_i
  end

  def both_valid?
    sender.valid? && receiver.valid? 
    #why does this not work with @sender and @receiver
    
  end

  def execute_transaction
    if both_valid? && @sender.balance > amount && @status == "pending"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if both_valid? && @receiver.balance > amount && @status == "complete"
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
    else
      reject_transfer
    end
  
  end
end