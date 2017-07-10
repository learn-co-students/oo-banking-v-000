class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount, status="pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
    if self.valid? && self.sender.balance > amount && self.status != "complete"
      complete_transaction
    else
      reject_transaction
    end
  end

  def complete_transaction
    self.sender.balance -= amount
    self.receiver.balance += amount
    self.status = "complete"
  end

  def reject_transaction
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if execute_transaction
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end
end
