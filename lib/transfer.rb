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
    self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
    if self.status == "complete"
      self
    elsif (self.sender.balance - self.amount) < 0
      #binding.pry
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.valid?
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
end
