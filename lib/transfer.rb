require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if both_valid? && self.status == "pending" && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    !both_valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      self.status = "rejected"
    end
  end
end