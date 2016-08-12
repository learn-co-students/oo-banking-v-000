class Transfer
  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end

  def valid? 
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if status == "pending" && valid? && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete" && valid? 
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end
end
