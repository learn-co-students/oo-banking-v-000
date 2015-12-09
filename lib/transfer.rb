require 'pry'
class Transfer
  
  attr_accessor :amount, :sender, :receiver, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && self.status == "pending" && sender.balance >= amount
      sender.balance, receiver.balance = sender.balance - amount, receiver.balance + amount
      self.status = "complete"
    else
      self.reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    sender.balance, receiver.balance = sender.balance + self.amount, receiver.balance - self.amount if self.status == "complete"
    self.status = "reversed"
  end


end