class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if self.status != "complete"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    end
    if sender.valid? == false
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end