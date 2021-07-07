class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def reject
    @status = "rejected"
      "Transaction rejected. Please check your account balance."
  end
  
  def execute_transaction
    if valid? && sender.balance >= amount && @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      reject
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end
end
