class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status == "pending" && sender.valid? == true && sender.balance >= amount #or if sender's balance is less than the amount!
      self.receiver.balance += amount
      self.sender.balance -= amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status != "pending"
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = "reversed"
    else
      nil
    end
  end

end
