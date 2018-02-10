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
  
  def sender_sufficient_funds?
    sender.balance > amount
  end
  
  def receiver_sufficient_funds?
    receiver.balance > amount
  end

  def execute_transaction
    if valid? && sender_sufficient_funds? && self.status == "pending"
      sender.withdraw(amount)
      receiver.deposit(amount)
      self.status = "complete"
    else
      invalid_transfer
    end
  end
  
  def reverse_transfer
    if valid? && receiver_sufficient_funds? && self.status == "complete"
      receiver.withdraw(amount)
      sender.deposit(amount)
      self.status = "reversed"
    else
      invalid_transfer
    end
  end

  def invalid_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  
end
