require 'pry'

class Transfer
  attr_accessor :status, :sender, :receiver, :amount, :balance

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    (sender.status == "open" && sender.balance > 0) && (receiver.status == "open" && receiver.balance > 0)
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if sender.balance > amount && sender.status == "open" && self.status != "complete"
      self.status = "complete"
      sender.balance -= amount
      receiver.balance += amount
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status != "pending"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
