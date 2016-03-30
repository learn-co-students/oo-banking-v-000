

class Transfer

  attr_accessor :sender, :receiver, :status, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

    def both_valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if both_valid? && sender.balance >= @amount && @status == "pending"
      receiver.balance = receiver.balance + amount
      sender.balance = sender.balance - amount
      @status = "complete"
    else 
      reject_transfer
    end
  end

  def reject_transfer
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
    receiver.balance = receiver.balance - amount
    sender.balance = sender.balance + amount
    @status = "reversed"
    end
  end

end