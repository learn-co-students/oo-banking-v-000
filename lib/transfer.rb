class Transfer
  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def tranfer(sender, receiver, amount)
    self.new(sender, receiver, amount)
  end

  def both_valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.both_valid? && @status == "pending" && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
   if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end

end
