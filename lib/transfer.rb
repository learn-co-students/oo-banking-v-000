class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    if sender.valid? == true && receiver.valid? == true
      true
    end
  end

  def execute_transaction
    if both_valid? && sender.balance > amount && status == "pending"
      sender.balance -= amount
      receiver.balance += amount 
      self.status = "complete"
    else 
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if receiver.balance > amount && status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end