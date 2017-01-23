require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

# Double Check
  def execute_transaction
    if self.status != "complete" && self.valid? && sender.balance >= amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end
end
