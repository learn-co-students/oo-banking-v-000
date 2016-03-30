class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  attr_reader 

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && sender.balance > amount && status == "pending"
      valid_transaction
    else
      reject_transfer
    end 
  end

  def valid_transaction
    sender.balance -= @amount
    receiver.balance += @amount
    @archived_amount = @amount
    @status = "complete"
    @amount = 0
  end

  def reject_transfer
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += @archived_amount
      receiver.balance -= @archived_amount
      @status = "reversed"
    end
  end

end