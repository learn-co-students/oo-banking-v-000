class Transfer
  #attr_reader :balance
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

  def execute_transaction
    if self.status == "pending" && sender.valid? && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transaction
    end
  end

  def reverse_transfer
    if self.status == "complete" && receiver.valid? && receiver.balance > amount
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else
      reject_transaction
    end
  end

  def reject_transaction
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
