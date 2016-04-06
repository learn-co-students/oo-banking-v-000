require 'pry'
class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def both_valid?
    @sender.valid? && @receiver.valid?
  end
  def execute_transaction
    if both_valid? && self.status == "pending" && sender.balance > amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    else
      reject_transfer
    end
  end
  def reject_transfer
     self.status = "rejected"
     return "Transaction rejected. Please check your account balance."
  end
  def reverse_transfer
    if self.status == "complete" && receiver.balance > amount && both_valid?
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end
end