require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status, :balance
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    self.status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
  if self.valid? && receiver.valid? && sender.balance > amount && self.status != "complete"
    receiver.balance = receiver.balance + amount
    sender.balance = sender.balance - amount
    self.status = "complete"
  else
    self.status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end
  end

  def reverse_transfer
    if self.status == "complete"
    receiver.balance = receiver.balance - amount
    sender.balance = sender.balance + amount
    self.status = "reversed"
    else
    "This reverse transfer could not be completed."
  end
  end

end
