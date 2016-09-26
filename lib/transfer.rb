require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if (sender.valid? && receiver.valid? && sender.balance >= amount)
      true
    else
      false
    end
  end

  def execute_transaction
    if (valid? && self.status == "pending")
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if (valid? && self.status == "complete")
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end

end
