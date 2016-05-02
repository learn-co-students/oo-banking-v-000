class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :count

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @count = 1
  end

  def both_valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if self.count == 1 && both_valid? == true && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
      @count += 1
    else
      self.reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
